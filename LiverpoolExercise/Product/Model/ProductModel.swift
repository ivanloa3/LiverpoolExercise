//
//  ProductModel.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/19/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import Foundation

class ProductModel{
    
    var Thumbnail: String!
    var Title: String!
    var Price: String!
    var Location: String!
    
    init(thumbnail: String, title: String, price: String, location: String) {
        self.Thumbnail = thumbnail
        self.Title = title
        self.Price = price
        self.Location = location
    }
    
    var thumbnail: String{
        get { return self.Thumbnail }
        set { self.Thumbnail = newValue }
    }
    
    var title: String{
        get { return self.Title }
        set { self.Title = newValue }
    }
    
    var price: String{
        get { return self.Price }
        set { self.Price = newValue }
    }
    
    var location: String{
        get { return self.Location }
        set { self.Location = newValue }
    }
    
}
