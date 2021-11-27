//
//  Employee.swift
//  EmployeesDemo
//
//  Created by Ken Mau on 2021-11-25.
//

import Foundation

struct Employee: Decodable {
    let status: String
//    let data: [EmployeeData]
}

struct EmployeeData: Decodable {
    let id, employeeName, employeeSalary, employeeAge: String
    let profileImage: String
    
    enum CodingKeys: String, CodingKeys {
        
    }
}
