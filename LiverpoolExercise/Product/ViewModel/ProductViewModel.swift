//
//  ProductViewModel.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/19/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import Foundation

class ProductViewModel {
    
    var products = [ProductModel]()
    let service = Service()
    
    func fetchProducts(with criterio: String, completion: @escaping () -> ()){
        
        service.fetchData_alamofire(criterio: criterio) { (products) in
            
           self.products = products
            
            completion()
        }

    }
    
    func fetchProduct(at index: Int) -> ProductModel{
        return products[index]
    }
    
    func getNumbersOfProducts() -> Int{
        return products.count
    }
    
}
