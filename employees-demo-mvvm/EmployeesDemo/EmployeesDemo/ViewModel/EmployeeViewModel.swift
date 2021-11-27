//
//  EmployeeViewModel.swift
//  EmployeesDemo
//
//  Created by Ken Mau on 2021-11-25.
//

import Foundation

// The ViewModel never knows what the view is, or what the view does
// This allows the architecture to be mor testable and removes complexity from the View
class EmployeeViewModel: NSObject {
    private var apiService: APIService!
    
    // Binding the ViewModel to the View
    // When empData gets a value, the observer will invoke the method
    private(set) var empData: Employee! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetEmployeeData { (empData) in
            print(empData)
        }
    }
}
