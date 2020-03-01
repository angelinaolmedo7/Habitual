//
//  Habit.swift
//  Habitual
//
//  Created by Angelina Olmedo on 3/1/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
import UIKit

struct Habit {
    enum Images: Int, CaseIterable {
        case book
        case bulb
        case clock
        case code
        case drop
        case food
        case grow
        case gym
        case heart
        case lotus
        case other
        case pet
        case pill
        case search
        case sleep
        case tooth
    }

    var image: UIImage {
        guard let image = UIImage(named: String(describing: self.selectedImage)) else {
            fatalError("image \(self) not found")
        }

        return image
    }
        
    var title: String
    let dateCreated: Date = Date()
    var selectedImage: Habit.Images

    var currentStreak: Int = 0
    var bestStreak: Int = 0
    var lastCompletionDate: Date?
    var numberOfCompletions: Int = 0

    var completedToday: Bool {
        return lastCompletionDate?.isToday ?? false
    }

    init(title: String, image: Habit.Images) {
        self.title = title
        self.selectedImage = image
    }
}
