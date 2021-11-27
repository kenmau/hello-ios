//
//  ViewController.swift
//  EmployeesDemo
//
//  Created by Ken Mau on 2021-11-25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var employeeTableView: UITableView!
    
    // ViewController has a reference to the ViewModel
    private var employeeViewModel: EmployeeViewModel
    
    private var dataSource: EmployeeTableViewDataSource

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func callToViewModelForUIUpdate() {
        self.employeeViewModel = EmployeeViewModel()
    }


}

