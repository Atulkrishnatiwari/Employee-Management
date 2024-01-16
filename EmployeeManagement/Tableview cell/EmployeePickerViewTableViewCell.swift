// EmployeePickerViewTableViewCell.swift

import UIKit


class EmployeePickerViewTableViewCell: UITableViewCell
{
    @IBOutlet weak var dropDownBox: UIButton!
    var delegate:StringProtocols?
    private var labelValueObservation: NSKeyValueObservation?
    @IBOutlet weak var pickData: UILabel!
    @IBOutlet weak var employeePickerLabel: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        dropDownBox.layer.borderColor = UIColor(red: 60/255, green: 64/255, blue: 80/255, alpha: 1.0).cgColor
        dropDownBox.layer.borderWidth = 2.0
        dropDownBox.layer.cornerRadius = 5.0
        valueChanged()
    }
    
    func valueChanged()
    {
        labelValueObservation = pickData.observe(\.text, options: [.new, .old], changeHandler: { (label, change) in
            if let newValue = change.newValue
            {
                if self.pickData.tag == 1
                {
                    if let labelText = self.pickData.text
                    {
                        self.delegate?.sendValue(value: IdentifyCell.gender(gender: labelText))
                    }
                }
                else if self.pickData.tag == 2
                {
                    if let labelText = self.pickData.text
                    {
                        self.delegate?.sendValue(value: IdentifyCell.designation(designation: labelText))
                    }
                }
            }
        })
    }
}
