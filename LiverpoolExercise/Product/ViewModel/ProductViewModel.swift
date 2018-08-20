//
//  ProductViewModel.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/19/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit
import CoreData

class ProductViewModel {
    
    private var products = [ProductModel]()
    private var searchedProducts = [SearchedProduct]()
    private let service = Service()
    
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchProducts(with criterio: String, completion: @escaping () -> ()){
        
        service.fetchData_alamofire(criterio: criterio) { (products) in
            
           self.products = products
            
            completion()
        }

    }
    
    func fetchProduct(at index: Int) -> ProductModel{
        return products[index]
    }
    
    func fetchSearchedProduct(at index: Int) -> SearchedProduct{
        return searchedProducts[index]
    }
    
    func getNumbersOfProducts() -> Int{
        return products.count
    }
    
    func getNumberOfSearchedProducts() -> Int{
        return searchedProducts.count
    }
    
    func addSearchedProduct(with title: String){
        
        let count = searchedProducts.count
        
        let product = SearchedProduct.init(entity: SearchedProduct.entity(), insertInto: context)
        
        let first = String(title.prefix(1)).uppercased()
        let other = String(title.dropFirst()).lowercased()
        product.title = first + other
        
        searchedProducts.append(product)
        
        if count < searchedProducts.count{
            // Product no repited
            appDelegate.saveContext()
        }
    }
    
    func updateSearchedProducts(){
        do {
            self.searchedProducts = try context.fetch(SearchedProduct.fetchRequest())
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func delete(searchedProduct: SearchedProduct){
        context.delete(searchedProduct)
        appDelegate.saveContext()
        
        updateSearchedProducts()
        
    }
    
}
