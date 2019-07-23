//
//  CustomTableViewCell.swift
//  sideMenututorial
//
//  Created by Jermal Ebanks on 22/07/2019.
//  Copyright © 2019 Jemarl Ebanks. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray = [String] ()
    
    var reuseCollectionViewID = "CustomCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 70, height: 80)
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.minimumInteritemSpacing = 5.0
        collectionView.collectionViewLayout = flowLayout
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
         imageArray = ["1.jpeg","2.jpeg","3.jpeg","4.jpeg","5.jpeg","6.jpeg","7.jpeg","8.jpeg","9.jpeg","10.jpeg","1.jpeg"]
       // print(imageArray)
    }

}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // make this the count of the amount of added houses/ work places.
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCollectionViewID, for: indexPath) as? CustomCollectionViewCell {
            
            let randomNumber = Int(arc4random_uniform(UInt32(imageArray.count)))
            cell.imageView.image = UIImage(named: imageArray[randomNumber])
            return cell
        }
        return UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = CGSize(width: 160, height: 160)
        return size
    }
    
    
}
