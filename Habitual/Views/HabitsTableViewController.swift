//
//  MainViewController.swift
//  Habitual
//
//  Created by Angelina Olmedo on 2/27/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

//struct Habit { // won't recognize in the other file for some reason :/
//    var title: String
//}

class HabitsTableViewController: UITableViewController {
    
    var habits: [Habit] = [
        Habit(title: "Go to bed before 10pm", image: Habit.Images.book),
        Habit(title: "Drink 8 Glasses of Water", image: Habit.Images.book),
        Habit(title: "Commit Today", image: Habit.Images.book),
        Habit(title: "Stand up every Hour", image: Habit.Images.book)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

      return habits.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

      var cell: UITableViewCell

      if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "cell") {

        cell = dequeueCell

        } else {

        cell = UITableViewCell(style: .default, reuseIdentifier: "cell")

      }

      let habit = habits[indexPath.row]

      cell.textLabel?.text = habit.title

      return cell

    }
}

extension HabitsTableViewController {

    func setupNavBar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
//        habits.insert("Hello, World!", at: 0)
//        let topIndexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [topIndexPath], with: .automatic)
    }
}
