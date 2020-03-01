//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by Angelina Olmedo on 2/29/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

extension UIViewController {
  static func instantiate() -> Self {
    return self.init(nibName: String(describing: self), bundle: nil)
  }
}
