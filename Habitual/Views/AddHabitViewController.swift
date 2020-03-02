//
//  AddHabitViewController.swift
//  Habitual
//
//  Created by Angelina Olmedo on 3/1/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class AddHabitViewController: UIViewController {
    
    let habitImages = [
        (UIImage(named: "book"), Habit.Images.book),
        (UIImage(named: "bulb"), Habit.Images.bulb),
        (UIImage(named: "clock"), Habit.Images.clock),
        (UIImage(named: "code"), Habit.Images.code),
        (UIImage(named: "drop"), Habit.Images.drop),
        (UIImage(named: "food"), Habit.Images.clock),
        (UIImage(named: "grow"), Habit.Images.grow),
        (UIImage(named: "gym"), Habit.Images.gym),
        (UIImage(named: "heart"), Habit.Images.heart),
        (UIImage(named: "lotus"), Habit.Images.lotus),
        (UIImage(named: "other"), Habit.Images.other),
        (UIImage(named: "pet"), Habit.Images.pet),
        (UIImage(named: "pill"), Habit.Images.pill),
        (UIImage(named: "search"), Habit.Images.search),
        (UIImage(named: "sleep"), Habit.Images.sleep),
        (UIImage(named: "tooth"), Habit.Images.tooth)
    ]
    
    var selectedIndexPath: IndexPath? {
        didSet {
            var indexPaths: [IndexPath] = []
            if let selectedIndexPath = selectedIndexPath {
                indexPaths.append(selectedIndexPath)
            }
            if let oldValue = oldValue {
                indexPaths.append(oldValue)
            }
            collectionView.performBatchUpdates({
                self.collectionView.reloadItems(at: indexPaths)
            })
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func pickPhotoButtonPressed(_ sender: Any) {
        guard let selectedIndexPath = selectedIndexPath else {return}
        let confirmHabitVC = ConfirmHabitViewController.instantiate()
        confirmHabitVC.habitImage = habitImages[selectedIndexPath.row]
        navigationController?.pushViewController(confirmHabitVC, animated: true)
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()

        collectionView.register(HabitImageCollectionViewCell.nib, forCellWithReuseIdentifier: HabitImageCollectionViewCell.identifier)
        setupNavBar()

    }
    
    func setupNavBar() {
        title = "Select Image"

        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddHabit(_:)))
        navigationItem.leftBarButtonItem = cancelButton

    }
    
    @objc func cancelAddHabit(_ sender: UIBarButtonItem) {

        self.presentingViewController?.dismiss(animated: true, completion: nil)

    }
}

extension AddHabitViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return habitImages.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitImageCollectionViewCell.identifier, for: indexPath) as! HabitImageCollectionViewCell
        if indexPath == selectedIndexPath{
            cell.setImage(image: habitImages[indexPath.row].0!, withSelection: true)
            
        }
        else{
            cell.setImage(image: habitImages[indexPath.row].0!, withSelection: false)
            
        }
        return cell }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/4, height: collectionViewWidth/4)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if selectedIndexPath == indexPath {
          selectedIndexPath = nil
        } else {
          selectedIndexPath = indexPath
        }
          return false
    }
}
