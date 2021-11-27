//
//  APIService.swift
//  EmployeesDemo
//
//  Created by Ken Mau on 2021-11-25.
//

import Foundation

class APIService: NSObject {
    private let sourceURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    func apiToGetEmployeeData(completion: @escaping (Employee) -> ()) {
        URLSession.shared.dataTask(with: sourceURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let empData = try! jsonDecoder.decode(Employee.self, from: data)
                    completion(empData)
            }
        }.resume()
    }
}
