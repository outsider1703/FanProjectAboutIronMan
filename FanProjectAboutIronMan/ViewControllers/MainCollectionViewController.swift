//
//  MainCollectionViewController.swift
//  FanProjectAboutIronMan
//
//  Created by Macbook on 20.06.2020.
//  Copyright © 2020 Igor Simonov. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {

    let categoryNames = CategoryName.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "backgroundT")
        let imageView = UIImageView(image: image)
        collectionView.backgroundView = imageView

    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
    
        let categoryName = categoryNames[indexPath.item]
        cell.categoryLabel.text = categoryName.rawValue
        
        cell.categoryImage.image = UIImage(named: "imageForCellOne")
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let userAction = categoryNames[indexPath.item]
        
        switch userAction {
        case .powerstats:
            performSegue(withIdentifier: "powerstats", sender: nil)
        case .apperance:
            performSegue(withIdentifier: "apperance", sender: nil)
        case .biography:
            performSegue(withIdentifier: "biography", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contentVC = segue.destination as! ContentViewController

        switch segue.identifier {
        case "powerstats":
            contentVC.selection = "powerstats"
            contentVC.fetchData()
        case "apperance" :
            contentVC.selection = "apperance"
            contentVC.fetchData()
        case "biography" :
            contentVC.selection = "biography"
            contentVC.fetchData()
        default:
            break
        }
    }

}


extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
