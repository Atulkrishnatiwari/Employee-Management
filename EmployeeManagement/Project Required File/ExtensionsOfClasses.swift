//
//  Myprotocol.swift
//  EmployeeManagement
//
//  Created by Celestial on 27/12/23.
//

import Foundation
import UIKit
extension ModificationViewController
{
    func showAlert(title:String,message:String)
    {
        DispatchQueue.main.async
        {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            self.present(alertController, animated: true)
            alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
        }
    }
}
extension EditViewController
{
    func showAlert(title:String,message:String)
    {
        DispatchQueue.main.async
        {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            self.present(alertController, animated: true)
            alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
        }
    }
}
extension HomeViewController
{
    func showAlert(title: String, message: String)
    {
        DispatchQueue.main.async
        {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            self.present(alertController, animated: true)
            alertController.addAction(UIAlertAction(title: "Got It", style: UIAlertAction.Style.default, handler: { action in
                self.filterEmployee()
                
            }))
        }
    }
    func filterEmployee()
    {
        let actionSheet = UIAlertController(title: "Select Designation", message: nil, preferredStyle: .actionSheet)
        for designation in Designation.allCases {
            let designationAction = UIAlertAction(title: designation.rawValue, style: .default) { [weak self] _ in
                guard let self = self else { return }
                self.searchBar(self.searchBar, textDidChange: "")
                self.performSearch(byDesignation: designation.rawValue)
            }
            actionSheet.addAction(designationAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] _ in
           
        }
        let allData = UIAlertAction(title: "All Data", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.searchBar(self.searchBar, textDidChange: "")
        }
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(allData)
        // Ensure UI updates on the main thread
        DispatchQueue.main.async
        {
            self.present(actionSheet, animated: true, completion: nil)
        }
    }
    func performSearch(byDesignation designation: String)
    {
        let filteredEmployees = homeViewModel.employeeData.filter
        { employee in
            return employee.designation.lowercased().contains(designation.lowercased())
        }
        
        homeViewModel.employeeData = filteredEmployees
        if(homeViewModel.employeeData.isEmpty)
        {
            showAlert(title: "Somthing Went Wrong", message: "Employee Not Found")
            viewForEmptyState.isHidden = false
            labelForEmptyState.text = "No Employee With \(designation) Designation"
        }
        else
        {
            searchBar.placeholder = ""
            viewForEmptyState.isHidden=true
        }
        tableView.reloadData()
    }
}
