//
//  HomeTableViewCell.swift
//  VW-project
//
//  Created by Chandra Welim on 19/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    let padding: CGFloat = 12
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var didTapCell: ((Int) -> Void)?
    var data: [Home] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundView?.backgroundColor = .clear
        collectionView.backgroundColor = .clear
    }
}

extension HomeTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.homeView.setup(home: data[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didTapCell?(indexPath.row)
    }
}

extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 104, height: 128)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
}
