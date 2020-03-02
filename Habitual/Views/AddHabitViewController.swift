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
        UIImage(named: "book"),
        UIImage(named: "bulb"),
        UIImage(named: "clock"),
        UIImage(named: "code"),
        UIImage(named: "drop"),
        UIImage(named: "food"),
        UIImage(named: "grow"),
        UIImage(named: "gym"),
        UIImage(named: "heart"),
        UIImage(named: "lotus"),
        UIImage(named: "other"),
        UIImage(named: "pet"),
        UIImage(named: "pill"),
        UIImage(named: "search"),
        UIImage(named: "sleep"),
        UIImage(named: "tooth")
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
            cell.setImage(image: habitImages[indexPath.row]!, withSelection: true)
            
        }
        else{
            cell.setImage(image: habitImages[indexPath.row]!, withSelection: false)
            
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
