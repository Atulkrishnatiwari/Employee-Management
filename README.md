# Employee Management System

**Screen Recording Of Application:**

[![Screen Recording](https://github.com/Atulkrishnatiwari/Employee-Management/assets/151607237/e6e0e157-ce51-4dde-8ceb-f71ed707e123)](https://github.com/Atulkrishnatiwari/Employee-Management/assets/151607237/e6e0e157-ce51-4dde-8ceb-f71ed707e123)

This Employee Management System is a Swift-based iOS application built on the MVVM (Model-View-ViewModel) architecture.
It follows the CRUD (Create, Read, Update, Delete) operations for managing employee data.

## Screenshots

<img src="https://github.com/Atulkrishnatiwari/Employee-Management/assets/151607237/96370d05-c38e-40da-a2d9-236131947408" alt="Image 1" width="200">
<img src="https://github.com/Atulkrishnatiwari/Employee-Management/assets/151607237/16cf67e3-ba65-48f1-947b-7bf40d6a08a4" alt="Image 2" width="200">
<img src="https://github.com/Atulkrishnatiwari/Employee-Management/assets/151607237/ebe5270e-b421-4ebd-a323-e7dbbb989e2c" alt="Image 3" width="200">
<img src="https://github.com/Atulkrishnatiwari/Employee-Management/assets/151607237/7d9ed5e2-785f-4269-866c-868959a34d8d" alt="Image 4" width="200">

## Features

- **MVVM Architecture:** The application is structured following the MVVM pattern, promoting separation of concerns and maintainability.
  - **Model:**
    - `Employee.swift`
    - `IdGenerator.swift`
  - **View:**
    - `Main.storyboard`
    - **Home Cell:**
      - `TableViewCell.swift`
    - **TableView Cell:**
      - `EmployeeIDTableViewCell.swift`
      - `EmployeeIDTableViewCell.xib`
      - `EmployeeTFieldTableViewCell.swift`
      - `EmployeeTFieldTableViewCell.xib`
      - `EmployeePickerViewTableViewCell.swift`
      - `EmployeePickerViewTableViewCell.xib`
      - `EmployeeDOBTableViewCell.swift`
      - `EmployeeDOBTableViewCell.xib`
      - `ImageTableViewCell.swift`
      - `ImageTableViewCell.xib`
  - **View Model:**
    - `ModificationModelView.swift`
    - `DetailsViewModel.swift`
    - `EditModelView.swift`
    - `HomeModelView.swift`
  - **Controller:**
    - `HomeViewController.swift`
    - `ModificationViewController.swift`
    - `DetailsViewController.swift`
    - `EditViewController.swift`
  - **Project Required Files:**
    - `ExtensionsOfClasses.swift`
    - `Protocols.swift`

- **CRUD Operations:** Implements Create, Read, Update, and Delete operations for managing employee records. in this we can Add,Delete,Edit,Search Employe Based on their
  Name nd we can also filter With Designation And show that Data To users 

- **Default Data Storage:** Utilizes a default data storage mechanism (e.g., UserDefaults) for simplicity. And I Have used my Own Model Object For Saving Data in
  With The Help Of UserDefaults 

- **Technology Uses:**
  - Swift
  - Storyboard

- **IDE:**
  - Xcode

# Implementation
- Implemented camera access and gallery access code.
- Used ActionSheet for picking data.
- Implemented date picker for date selection.

## Getting Started

**Open in Xcode:**
  Open the project in Xcode.

**Build and Run:**
  Build and run the project in the Xcode simulator or on a physical device.

# How to Use

**Installation:**
  Open the Xcode project.
  Build and run the application on a simulator or a physical iOS device.

**Setup:**
  Follow on-screen instructions for initial setup.
  Provide necessary permissions if prompted.

**User Interactions:**
  Navigate through the app using the provided tabs and buttons.
  Interact with the employee records, edit details, and delete entries.

**Common Scenarios:**
  - Add a new employee by following the designated flow.
  - Edit existing employee details.
  - Delete unnecessary records.
  - View detailed information for each employee.
