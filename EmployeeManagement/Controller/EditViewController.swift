//
//  EditViewController.swift
//  EmployeeManagement
//
//  Created by Celestial on 02/01/24.
//

import UIKit

class EditViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate
{
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mobNoTF: UITextField!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var datePickerL: UIDatePicker!
    
    var detailsOfEmployee: EditModelView?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        emailTF.delegate = self
        nameTF.delegate = self
        mobNoTF.delegate = self
        
        allDetails()
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.clipsToBounds = true
    }
    
    func allDetails()
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        if let detail = detailsOfEmployee?.details
        {
            self.navigationItem.title = detail.name.uppercased()
            profileImage.image = detail.image
            idLabel.text = detail.empId
            nameTF.text = detail.name
            emailTF.text = detail.email
            mobNoTF.text = detail.mobileNo
            genderLabel.text = detail.gender
            designationLabel.text = detail.designation
            if let dateOfBirth = dateFormatter.date(from: detail.dateOfBirth)
            {
                datePickerL.setDate(dateOfBirth, animated: true)
            }
            else
            {
                print("Error converting date from string to Date.")
            }
        }
    }
    @IBAction func genderPick(_ sender: UIButton)
    {
        let actionSheet = UIAlertController(title: "Select Gender", message: nil, preferredStyle: .actionSheet)
        
        let maleAction = UIAlertAction(title: "Male", style: .default) { [weak self] _ in
            self?.genderLabel.text = "Male"
        }
        
        let femaleAction = UIAlertAction(title: "Female", style: .default) { [weak self] _ in
            self?.genderLabel.text = "Female"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(maleAction)
        actionSheet.addAction(femaleAction)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
    }
    @IBAction func designationPick(_ sender: UIButton)
    {
        let actionSheet = UIAlertController(title: "Select Designation", message: nil, preferredStyle: .actionSheet)

        for designation in Designation.allCases 
        {
            let designationAction = UIAlertAction(title: designation.rawValue, style: .default) { [weak self] _ in
                self?.designationLabel.text = designation.rawValue
            }
            actionSheet.addAction(designationAction)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)

        present(actionSheet, animated: true, completion: nil)
    }
    @IBAction func updateData(_ sender: UIButton)
    {
        guard let profileName = nameTF.text,
              let email = emailTF.text,
              let phoneNo = mobNoTF.text,
              let employeeID = idLabel.text,
              let gender = genderLabel.text,
              let designation = designationLabel.text
        else {
            showAlert(title: "Error", message: "Please fill in all required fields.")
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateOfBirth = dateFormatter.string(from: datePickerL.date)
        
        let newEmployee = Employee(image: profileImage.image, empId: employeeID, name: profileName, email: email, mobileNo: phoneNo, gender: gender, designation: designation, dateOfBirth: dateOfBirth)
        
        if let mainViewController = navigationController?.viewControllers.first as? HomeViewController
        {
            mainViewController.homeViewModel.updateEmployeeData(newEmployee)
            mainViewController.homeViewModel.saveItem(mainViewController.tableView)
            navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func chooseImage(_ sender: UIButton)
    {
        let imagePicker = UIImagePickerController()
        let actionSheet = UIAlertController(title: "Select Source", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                imagePicker.sourceType = .camera
                self?.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                self?.showAlert(title: "Error", message: "No Source is Availabel")
            }
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) {[weak self] _ in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
            {
                imagePicker.sourceType = .savedPhotosAlbum
                self?.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(galleryAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    /////
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[.originalImage] as? UIImage
        {
            profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
extension EditViewController: UITextFieldDelegate 
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == emailTF || textField == mobNoTF || textField == nameTF 
        {
            textField.resignFirstResponder()
            return true
        }
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) 
    {
        textField.resignFirstResponder()
    }
}
