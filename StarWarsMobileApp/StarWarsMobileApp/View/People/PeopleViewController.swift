//
//  PeopleViewController.swift
//  StarWarsMobileApp
//
//  Created by Amandeep Kaur on 29/08/21.
//

import UIKit
import CustomerioStarWars

class PeopleViewController: UIViewController {
    
    // MARK:- OUTLETS
    @IBOutlet weak var peopleCollView: UICollectionView!
    
    // MARK:- VARIABLES
    let sdkManager = CIOManager()
    let peopleCount = 5
    var peopleData : [People]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleCollView.dataSource = self
        peopleCollView.delegate = self
        obj.getPeopleEyes(forCount: peopleCount) { peopleData in
            
            DispatchQueue.main.async {
                self.peopleData = peopleData
                self.peopleCollView.reloadData()
            }
        }
    }
}

// MARK:- DATASOURCE
extension PeopleViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.peopleData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PeopleCollectionViewCell", for: indexPath) as! PeopleCollectionViewCell
        
        let data = peopleData?[indexPath.row]
        cell.eyeColorText.text  = "Eye Color : \(data?.eye_color ?? "-")"
        cell.nameTitle.text     = "Actor Name : \(data?.name ?? "-")"
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.green : UIColor.yellow
        
        return cell
    }
}

// MARK:- DELEGATE
extension PeopleViewController :  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
                let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
                let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
                return CGSize(width: size, height: size)
    }
}
