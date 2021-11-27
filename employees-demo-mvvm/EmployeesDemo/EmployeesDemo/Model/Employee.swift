//
//  Employee.swift
//  EmployeesDemo
//
//  Created by Ken Mau on 2021-11-25.
//

import Foundation

struct Employee: Decodable {
    let status: String
    let data: [EmployeeData]
}

struct EmployeeData: Decodable {
    let id, employeeName, employeeSalary, employeeAge: String
    let profileImage: String
    
    // used to map different JSON string names to swift properties
    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
