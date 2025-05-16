//
//  TaskListViewController.swift
//  DailyTaskTracker
//
//   Created By Dion.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self

        // Example data to test
        tasks = ["Buy groceries", "Walk the dog", "Finish project"]
        tableView.reloadData()
    }

    // MARK: - TableView Data Source Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
