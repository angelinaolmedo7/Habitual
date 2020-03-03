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
    
    private var persistence = PersistenceLayer()
    
    var habits: [Habit] = [
        Habit(title: "Go to bed before 10pm", image: Habit.Images.book),
        Habit(title: "Drink 8 Glasses of Water", image: Habit.Images.book),
        Habit(title: "Commit Today", image: Habit.Images.book),
        Habit(title: "Stand up every Hour", image: Habit.Images.book)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.register(
                    HabitTableViewCell.nib,
                    forCellReuseIdentifier: HabitTableViewCell.identifier
        )

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         let selectedHabit = persistence.habits[indexPath.row]
         let habitDetailVC = HabitDetailViewController.instantiate()
         habitDetailVC.habit = selectedHabit
         habitDetailVC.habitIndex = indexPath.row
         navigationController?.pushViewController(habitDetailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistence.habits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell( withIdentifier: HabitTableViewCell.identifier, for: indexPath) as! HabitTableViewCell
      let habit = persistence.habits[indexPath.row]
      cell.configure(habit)
      return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        persistence.setNeedsToReloadHabits()
        tableView.reloadData()
    }
}

extension HabitsTableViewController {

    func setupNavBar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
      let addHabitVC = AddHabitViewController.instantiate()
      let navigationController = UINavigationController(rootViewController: addHabitVC)
      navigationController.modalPresentationStyle = .fullScreen
      present(navigationController, animated: true, completion: nil)
    }
}
