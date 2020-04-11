//
//  ProductTableViewCell.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

struct Product {
    var name: String
    var price: String
    var count: Int
}

class ProductTableViewCell: UITableViewCell {
    
    let array: [Product] = [
        Product(name: "Adult", price: "50,000 ₫", count: 2),
        Product(name: "Child", price: "20,000 ₫", count: 0),
        Product(name: "Senior", price: "35,000 ₫", count: 0)
    ]

    @IBOutlet weak var productTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.separatorStyle = .none
    }
}

extension ProductTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductCell
        let data = array[indexPath.row]
        cell.productView.set(productName: data.name, price: data.price, productCount: data.count)
        cell.productView.plusPressed = {
            let t = cell.productView.getCount() + 1
            
            cell.productView.set(productName: data.name, price: data.price, productCount: t)
        }
        cell.productView.minusPressed = {
            let t = cell.productView.getCount() > 0 ? cell.productView.getCount() - 1 : cell.productView.getCount()
            
            cell.productView.set(productName: data.name, price: data.price, productCount: t)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
