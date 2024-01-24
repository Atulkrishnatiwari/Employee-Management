//
//  EmployeeTFieldTableViewCell.swift
//  EmployeeManagement
//
//  Created by Celestial on 22/12/23.
//

import UIKit

class EmployeeTFieldTableViewCell: UITableViewCell
{
    var delegate:StringProtocols?
    @IBOutlet weak var employeeTF: UITextField!
    @IBOutlet weak var employeeLabel: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        employeeTF.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
extension EmployeeTFieldTableViewCell: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        employeeTF.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        if(textField.text != "")
        {
            return true
        }
        else
        {
            textField.placeholder = "Type Something"
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if(employeeTF.tag == 1)
        {
            if let name = employeeTF.text
            {
                delegate?.sendValue(value: IdentifyCell.name(name: name))
            }
        }
        else if(employeeTF.tag == 2)
        {
            if let email = employeeTF.text
            {
                delegate?.sendValue(value: IdentifyCell.email(email: email))
            }
        }
        else if(employeeTF.tag == 3)
        {
            if let phone = employeeTF.text
            {
                delegate?.sendValue(value: IdentifyCell.phoneNum(number: phone))
            }
        }
    }
}
