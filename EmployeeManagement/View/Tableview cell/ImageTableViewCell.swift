//
//  ImageTableViewCell.swift
//  EmployeeManagement
//
//  Created by Celestial on 22/12/23.
//

import UIKit


class ImageTableViewCell: UITableViewCell,UIImagePickerControllerDelegate & UINavigationControllerDelegate
{
    
    var viewController : ModificationViewController?
    var delegate:ImageProtocol?
    @IBOutlet weak var uiViewImage: UIView!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    @IBOutlet weak var updateImageButton: UIButton!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        circleImage()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func pickImage(_ sender: UIButton)
    {
        let imagePicker = UIImagePickerController()
        let actionSheet = UIAlertController(title: "Select Source", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                imagePicker.sourceType = .camera
                self?.viewController?.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                self?.viewController?.showAlert(title: "Error", message: "No Source is Availabel")
            }
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) {[weak self] _ in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
            {
                imagePicker.sourceType = .savedPhotosAlbum
                self?.viewController?.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(galleryAction)
        actionSheet.addAction(cancelAction)
        
        self.viewController?.present(actionSheet, animated: true, completion: nil)
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    /////
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[.originalImage] as? UIImage
        {
            userProfileImageView.image = image
            delegate?.selectImage(image: image)
        }
        viewController?.dismiss(animated: true, completion: nil)
    }
    func circleImage()
    {
        uiViewImage.layer.cornerRadius = uiViewImage.frame.width / 2
        uiViewImage.clipsToBounds = true
    }
}
