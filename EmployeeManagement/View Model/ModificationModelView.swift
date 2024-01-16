//
//  ModificationModelView.swift
//  EmployeeManagement
//
//  Created by Celestial on 27/12/23.
//

import Foundation
import UIKit
class ModificationModelView
{
    
    var profileImage:UIImage?
    var profileName:String?
    var email:String?
    var phoneNo:String?
    var empId:String?
    var dOB:String?
    var gender:String?
    var designation:String?
    weak var delegate: ModificationViewController?
    var tableView:UITableView?
    //MARK: -Registration Cells
    func registerCells()
    {
        tableView?.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
        tableView?.register(UINib(nibName: "EmployeeIDTableViewCell", bundle: nil), forCellReuseIdentifier: "IDCell")
        tableView?.register(UINib(nibName: "EmployeeTFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "TFCell")
        tableView?.register(UINib(nibName: "EmployeePickerViewTableViewCell", bundle: nil), forCellReuseIdentifier: "PickerCell")
        tableView?.register(UINib(nibName: "EmployeeDOBTableViewCell", bundle: nil), forCellReuseIdentifier: "DatePickerViewCell")
    }
    //MARK: -tableView delegate and data source dependency
    func numberOfsections() -> Int
    {
        return 8
    }
    func numberOfRowsInSection() -> Int
    {
        return 1
    }
    func heightForRowAtIndex(_ section:Int) -> Int
    {
        if(section == 0)
        {
            return 150
        }
        else
        {
            return 70
        }
    }
    //MARK: -actionsheet code
    func labelPicker(_ sender: UIButton, at indexPath: IndexPath)
    {
        switch indexPath.section
        {
        case 5:
            handleGenderSelection(at: indexPath)
            
        case 6:
            handleDesignationSelection(at: indexPath)
            
        default:
            break
        }
    }
    //MARK: -actionsheet function dependency
    private func handleGenderSelection(at indexPath: IndexPath) {
        let actionSheet = UIAlertController(title: "Select Gender", message: nil, preferredStyle: .actionSheet)
        
        let maleAction = UIAlertAction(title: "Male", style: .default) { [weak self] _ in
            self?.updatePickerData("Male", at: indexPath)
        }
        
        let femaleAction = UIAlertAction(title: "Female", style: .default) { [weak self] _ in
            self?.updatePickerData("Female", at: indexPath)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(maleAction)
        actionSheet.addAction(femaleAction)
        actionSheet.addAction(cancelAction)
        
        delegate?.present(actionSheet, animated: true, completion: nil)
    }
    //MARK: -actionsheet function handleGenderselection dependency
    private func handleDesignationSelection(at indexPath: IndexPath)
    {
        let actionSheet = UIAlertController(title: "Select Designation", message: nil, preferredStyle: .actionSheet)
        
        for designation in Designation.allCases
        {
            let designationAction = UIAlertAction(title: designation.rawValue, style: .default) { [weak self] _ in
                self?.updatePickerData(designation.rawValue, at: indexPath)
            }
            actionSheet.addAction(designationAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)
        delegate?.present(actionSheet, animated: true, completion: nil)
    }
    //MARK: -actionsheet function handleDesignation dependency
    func updatePickerData(_ data: String, at indexPath: IndexPath)
    {
        if let cell = tableView?.cellForRow(at: indexPath) as? EmployeePickerViewTableViewCell
        {
            cell.pickData.text = data
        }
    }
    deinit {
        tableView = nil
        tableView = nil
       }
}
extension ModificationViewController:ImageProtocol,StringProtocols
{
    func sendValue(value: IdentifyCell)
    {
        switch value
        {
        case .EmployeeId(let empId):
            modificationModelView.empId = empId
        case .name(let name):
            modificationModelView.profileName = name
        case .email(let mail):
            modificationModelView.email = mail
        case .phoneNum(let number):
            modificationModelView.phoneNo = number
        case .gender(let gender):
            modificationModelView.gender = gender
        case .designation(let designation):
            modificationModelView.designation = designation
        case .Date(let date):
            modificationModelView.dOB = date
        }
        saveButtonOutlet.isEnabled = true
    }
    
    func selectImage(image: UIImage)
    {
        modificationModelView.profileImage = image
        saveButtonOutlet.isEnabled = true
    }
    
    @IBAction func saveDetails(_ sender: UIButton)
    {
        if let profileName = modificationModelView.profileName, let email = modificationModelView.email, let phoneNo = modificationModelView.phoneNo, let profileImage = modificationModelView.profileImage, let employeeID = modificationModelView.empId, let dateOfBirth = modificationModelView.dOB, let gender = modificationModelView.gender, let designation = modificationModelView.designation
        {
            saveButtonOutlet.isEnabled = true
            delegate?.fetchEmployee(employee: Employee(image: profileImage, empId: employeeID, name: profileName, email: email, mobileNo: phoneNo, gender: gender, designation: designation, dateOfBirth: dateOfBirth))
            navigationController?.popViewController(animated: true)
        }
        else
        {
            showAlert(title: "Error", message: "Please Enter All Required Field")
            saveButtonOutlet.isEnabled = false
        }
        saveButtonOutlet.isEnabled = false
    }
}
