//
//  DetailsViewController.swift
//  EmployeeManagement
//
//  Created by Celestial on 26/12/23.
//

import UIKit

class DetailsViewController: UIViewController
{
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    var detailsView : DetailsViewModel?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.clipsToBounds = true
        
        initializeLabels()
    }
    func initializeLabels()
    {
        if let detail = detailsView?.details
        {
            self.navigationItem.title = detail.name.uppercased()
            profileImage.image = detail.image
            idLabel.text = detail.empId
            nameLabel.text = detail.name
            emailLabel.text = detail.email
            noLabel.text = detail.mobileNo
            genderLabel.text = detail.gender
            designationLabel.text = detail.designation
            dobLabel.text = detail.dateOfBirth
        }
    }
}
