//
//  EmployeeIDTableViewCell.swift
//  EmployeeManagement
//
//  Created by Celestial on 22/12/23.
//

import UIKit

class EmployeeIDTableViewCell: UITableViewCell 
{
    var delegate:StringProtocols?
    @IBOutlet weak var employeeID: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) 
    {
        super.setSelected(selected, animated: animated)

    }
    func getemployeeId()
    {
        if let empid = employeeID.text
        {
            delegate?.sendValue(value: IdentifyCell.EmployeeId(id: empid))
        }
    }
}
