//
//  EmployeeDOBTableViewCell.swift
//  EmployeeManagement
//
//  Created by Celestial on 22/12/23.
//

import UIKit

class EmployeeDOBTableViewCell: UITableViewCell 
{
    var delegate:StringProtocols?
    @IBOutlet weak var datePicker: UIDatePicker!
    override func awakeFromNib() 
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func pickDate(_ sender: UIDatePicker)
    {
//        self.datePicker.addTarget(self, action: #selector(pickerTapped), for: .primaryActionTriggered)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let selectedDateAsString = formatter.string(from: sender.date)
        delegate?.sendValue(value: IdentifyCell.Date(date: selectedDateAsString))
    }
    
//    @objc func pickerTapped()
//    {
//        self.datePicker.preferredDatePickerStyle = .wheels
//        self.datePicker.preferredDatePickerStyle = .automatic
//    }
}
