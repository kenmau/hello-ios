import UIKit


let dispatchQueue = DispatchQueue(label: "testQueue")

dispatchQueue.async {
    print("I'm on testQueue")
}

// Two types of closures:
// 1. Escaping (stored as property or captured by another closure)
// 2. Non-Escaping (cannot be stored, must be executed directly when used)


// 1. Escaping Closures
// Ex. Async APIs, DispatchQueue
DispatchQueue.main.async {
    print("I'm on Main Thread")
}


// 2. Non-Escaping
[1,2,3].forEach({ number in
    print(number)
})


class ListViewModel {
    
}

// Retain Cycle Example (and how to break the retain cycle)

class ListViewController: UITableViewController {
    private let viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel.super.init(nibName: nil, bundle: nil)
    }
    
    viewModel.observeNumberOfItemsChanged { [weak self] in
        self?.tableView.reloadData()
    }
}

// Alternative to capturing [weak self]
// Use tuple
let context = (
    parser: parser,
    schema: schema
)

dataLoader.loadData(from: url) { data in
    
}
