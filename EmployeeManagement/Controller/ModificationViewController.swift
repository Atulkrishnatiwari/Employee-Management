//
//  ModificationViewController.swift
//  EmployeeManagement
//
//  Created by Celestial on 22/12/23.
//

//Original

import UIKit

class ModificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var delegate:EmployeeData?
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var modificationModelView = ModificationModelView()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        modificationModelView.delegate = self
        modificationModelView.tableView = tableView
        modificationModelView.registerCells()
    }
    
    //MARK: -TableView Other Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return modificationModelView.numberOfsections()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return CGFloat(modificationModelView.heightForRowAtIndex(indexPath.section))
    }
    //MARK: -TableView Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return modificationModelView.numberOfRowsInSection()
    }
    
    //MARK: -TableView Delegate Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.viewController = self
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath) as? EmployeeIDTableViewCell else {
                return UITableViewCell()
            }
            cell.employeeID.text = IdGenerator.sharedInstance.generate()
            cell.employeeID.tag = indexPath.row
            cell.delegate = self
            cell.getemployeeId()
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TFCell", for: indexPath) as? EmployeeTFieldTableViewCell else
            {
                return UITableViewCell()
            }
            cell.employeeLabel.text = "Name"
            cell.employeeTF.tag = 1
            cell.delegate = self
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TFCell", for: indexPath) as? EmployeeTFieldTableViewCell else {
                return UITableViewCell()
            }
            cell.employeeLabel.text = "Email"
            cell.employeeTF.tag = 2
            cell.delegate = self
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TFCell", for: indexPath) as? EmployeeTFieldTableViewCell else {
                return UITableViewCell()
            }
            cell.employeeLabel.text = "Phone No"
            cell.employeeTF.tag = 3
            cell.delegate = self
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as? EmployeePickerViewTableViewCell else
            {
                return UITableViewCell()
            }
            cell.employeePickerLabel.text = " Select Gender"
            cell.pickData.text = "Not Selected"
            cell.dropDownBox.addTarget(self, action: #selector(pickerButton(_:)), for: .touchUpInside)
            cell.pickData.tag = 1
            cell.delegate = self
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as? EmployeePickerViewTableViewCell else
            {
                return UITableViewCell()
            }
            cell.employeePickerLabel.text = "Select Designation"
            cell.pickData.text = "Not Selected"
            cell.dropDownBox.addTarget(self, action: #selector(pickerButton(_:)), for: .touchUpInside)
            cell.pickData.tag = 2
            cell.delegate = self
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerViewCell", for: indexPath) as? EmployeeDOBTableViewCell else
            {
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        default :
            return UITableViewCell()
        }
    }
    //MARK: -TableView Methods End
    @objc func pickerButton(_ sender: UIButton)
    {
        guard let indexPath = tableView.indexPath(for: sender.superview?.superview as! UITableViewCell) else
        {
            return
        }
        modificationModelView.labelPicker(sender, at: indexPath)
    }
}
