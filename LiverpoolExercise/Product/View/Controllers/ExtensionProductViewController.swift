//
//  ExtensionProductViewController.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/19/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit

extension ProductViewController{
    func goNextView(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductRecordsViewController") as! ProductRecordsViewController
        
        vc.productViewModel = self.productViewModel
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension ProductViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        productViewModel.addSearchedProduct(with: searchBar.text!)
        self.tableView.reloadData()
        self.curtainView.alpha = 0.6
        
        
        var temp = searchBar.text!
        temp = temp.replacingOccurrences(of: " ", with: "%20")
        
        self.productViewModel.fetchProducts(with: temp) {
            self.curtainView.alpha = 0
            searchBar.text = ""
            self.goNextView()
            
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        self.viewSearchTable.alpha = 1
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        self.viewSearchTable.alpha = 0
    }

}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productViewModel.getNumberOfSearchedProducts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchedProductTableViewCell
        
        let searchedProduct = productViewModel.fetchSearchedProduct(at: indexPath.row)
        
        cell.set(title: searchedProduct.title ?? "")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.curtainView.alpha = 0.6
        var temp = self.productViewModel.fetchSearchedProduct(at: indexPath.row).title ?? ""
        temp = temp.replacingOccurrences(of: " ", with: "%20")
        self.productViewModel.fetchProducts(with: temp) {
            self.curtainView.alpha = 0
            self.goNextView()
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let temp = self.productViewModel.fetchSearchedProduct(at: indexPath.row)
            self.productViewModel.delete(searchedProduct: temp)
            self.tableView.reloadData()
        }
    }

}
