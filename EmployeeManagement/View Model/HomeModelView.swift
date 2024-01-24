//
//  HomeModelView.swift
//  EmployeeManagement
//
//  Created by Celestial on 04/01/24.
//

import Foundation
import UIKit
class HomeModelView
{
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Employees.plist")
    let userDefaults = UserDefaults.standard
    var employeeData = [Employee]()
//    func saveItem()
//    {
//        let encoder = PropertyListEncoder()
//        do
//        {
//            let data = try encoder.encode(employeeData)
//            try data.write(to: dataFilePath!)
//        }
//        catch
//        {
//            print("Error During encoding Data\(error)")
//        }
//    }
    func saveItem()
    {
        do
        {
            let encodeData = try JSONEncoder().encode(employeeData)
            userDefaults.set(encodeData, forKey: "EmployeeList")
        }
        catch
        {
            print("Error During encoding Data\(error)")
        }
    }
//    func loadDetails()
//    {
//        if let data = try? Data(contentsOf: dataFilePath!)
//        {
//            let decoder = PropertyListDecoder()
//            do
//            {
//                employeeData = try decoder.decode([Employee].self, from: data)
//            }
//            catch
//            {
//                print("Error While decoding data\(error)")
//            }
//        }
//    }
    func loadDetails()
    {
        if let savedData = userDefaults.object(forKey: "EmployeeList") as? Data
        {
            do
            {
                let employeeList = try JSONDecoder().decode([Employee].self, from: savedData)
                employeeData = employeeList
            }
            catch
            {
                print("Error While decoding data\(error)")
            }
        }
    }
    func updateEmployeeData(_ newEmployee: Employee)
    {
        if let index = employeeData.firstIndex(where: { $0.empId == newEmployee.empId })
        {
            employeeData[index] = newEmployee
        }
    }
}
