import UIKit

class Employee: Codable {
    let imageData: Data
    let empId: String
    let name: String
    let email: String
    let mobileNo: String
    let gender: String
    let designation: String
    let dateOfBirth: String

    var image: UIImage? 
    {
        return UIImage(data: imageData)
    }

    init(image: UIImage?, empId: String, name: String, email: String, mobileNo: String, gender: String, designation: String, dateOfBirth: String) {
        // Convert UIImage to Data for storage
        self.imageData = image?.jpegData(compressionQuality: 1.0) ?? Data()
        self.empId = empId
        self.name = name
        self.email = email
        self.mobileNo = mobileNo
        self.gender = gender
        self.designation = designation
        self.dateOfBirth = dateOfBirth
    }
}
