//
//  TaskListViewController.swift
//  DailyTaskTracker
//
//   Created By Dion.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: – IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // The array of tasks
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Wire up dataSource & delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Optional: Register default UITableViewCell if you didn't in storyboard
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
    }

    // MARK: – IBActions

    
    @IBAction func addTaskTapped(_ sender: UIButton) {
    let alert = UIAlertController(title: "New Task", message: "Enter task name", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Task name"
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default) { _ in
            guard let text = alert.textFields?.first?.text, !text.isEmpty else { return }
            self.tasks.append(text)
            self.tableView.reloadData()
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }

    
    @IBAction func logoutTapped(_ sender: UIButton) {

    navigationController?.popToRootViewController(animated: true)
    }

    // MARK: – UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }

    // Enable swipe-to-delete
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: – UITableViewDelegate

    // Tap to edit
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let current = tasks[indexPath.row]
        let alert = UIAlertController(title: "Edit Task",
                                      message: "Modify task name",
                                      preferredStyle: .alert)
        alert.addTextField { tf in
            tf.text = current
        }
        alert.addAction(UIAlertAction(title: "Save", style: .default) { _ in
            guard let updated = alert.textFields?.first?.text, !updated.isEmpty else { return }
            self.tasks[indexPath.row] = updated
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
        
        // Deselect row so it doesn't stay highlighted
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
