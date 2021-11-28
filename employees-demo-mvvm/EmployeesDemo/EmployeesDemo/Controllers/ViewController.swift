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
    
    private var dataSource: EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>!

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate() {
        self.employeeViewModel = EmployeeViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }

    func updateDataSource() {
        self.dataSource = EmployeeTableViewDataSource(cell)
    }

}


class EmployeeTableViewDataSource<CELL
