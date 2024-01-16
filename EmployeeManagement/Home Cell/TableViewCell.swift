//
//  TableViewCell.swift
//  EmployeeManagement
//
//  Created by Celestial on 22/12/23.
//

import UIKit

class TableViewCell: UITableViewCell 
{
    @IBOutlet weak var editDetails: UIButton!
    @IBOutlet weak var showDetails: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var imageViewUi: UIView!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        imageViewUi.layer.cornerRadius = imageViewUi.frame.width / 2
        imageViewUi.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) 
    {
        super.setSelected(selected, animated: animated)
    }

}
