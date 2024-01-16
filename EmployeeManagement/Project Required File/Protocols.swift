//
//  Protocols.swift
//  EmployeeManagement
//
//  Created by Celestial on 29/12/23.
//

import Foundation
import UIKit
enum IdentifyCell {
    case EmployeeId(id: String)
    case name(name: String)
    case email(email: String)
    case phoneNum(number: String)
    case gender(gender:String)
    case designation(designation:String)
    case Date(date: String)
}
enum Designation: String, CaseIterable 
{
    case engineeringManager = "Engineering Manager"
    case hiringManager = "Hiring Manager"
    case teamLead = "Team Lead"
    case softwareEngineer = "Software Engineer"
    case trainee = "Trainee"
    case intern = "Intern"
    case softwareTester = "Software Tester"
}

protocol StringProtocols
{
    func sendValue(value: IdentifyCell)
}
/////
protocol ImageProtocol
{
    func selectImage(image:UIImage)
}
protocol EmployeeData
{
    func fetchEmployee(employee:Employee)
}
