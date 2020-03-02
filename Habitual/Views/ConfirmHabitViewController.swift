//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Angelina Olmedo on 3/1/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {
    
    var habitImage: (UIImage?, Habit.Images?)

    @IBOutlet weak var habitImageView: UIImageView!
    @IBOutlet weak var habitNameInputField: UITextField!
    @IBAction func createHabitButtonPressed(_ sender: Any) {
        var persistenceLayer = PersistenceLayer()
        guard let habitText = habitNameInputField.text else { return }
        persistenceLayer.createNewHabit(name: habitText, image: habitImage.1!)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateUI()
    }

    private func updateUI() {
        title = "New Habit"
        habitImageView.image = habitImage.0
    }
}
