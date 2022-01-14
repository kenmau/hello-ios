//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemTeal
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        let newItem = Item(title: "Groceries")
        itemArray.append(newItem)
        
        let newItem2 = Item(title: "Buy Eggs")
        itemArray.append(newItem2)
        
        let newItem3 = Item(title: "Buy Milk")
        itemArray.append(newItem3)
        
        let newItem4 = Item(title: "blah")
        itemArray.append(newItem4)
        
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
//        itemArray.append(newItem4)
        
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        }
    }
    
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
//        let cellAccessoryType = tableView.cellForRow(at: indexPath)?.accessoryType
//
//        tableView.cellForRow(at: indexPath)?.accessoryType = cellAccessoryType == .checkmark ? .none : .checkmark
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        // Button to press
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            // What will happen once the uesr clicks the add item button on the UI alert
            if let textFieldText = textField.text, textFieldText != "" {
                let newItem = Item(title: textFieldText)
                
                self.itemArray.append(newItem)
                self.defaults.set(self.itemArray, forKey: "TodoListArray")
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

