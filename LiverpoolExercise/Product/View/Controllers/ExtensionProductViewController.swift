//
//  ExtensionProductViewController.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/19/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit



extension ProductViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        self.curtainView.alpha = 0.6
        
        self.productViewModel.fetchProducts(with: searchBar.text!) {
            self.curtainView.alpha = 0
            self.tableView.reloadData()
        }
    }

}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productViewModel.getNumbersOfProducts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        
        let product = productViewModel.fetchProduct(at: indexPath.row)
        cell.set(product: product)
        
        return cell
        
    }
    

}
