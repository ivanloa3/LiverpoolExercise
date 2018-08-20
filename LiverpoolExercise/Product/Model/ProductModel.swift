//
//  ProductModel.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/19/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import Foundation

class ProductModel{
    
    private var Thumbnail: URL!
    private var Title: String!
    private var Price: String!
    private var Location: String!
    
    init(thumbnail: URL, title: String, price: String, location: String) {
        self.Thumbnail = thumbnail
        self.Title = title
        self.Price = price
        self.Location = location
    }
    
    var thumbnail: URL{
        get {
            if self.Thumbnail != nil{
                return self.Thumbnail
                }else{
                return URL(fileURLWithPath: "https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/7f/fa/85/7ffa858c-2c0b-bbcb-2439-5031d6d21d31/AppIcon-1x_U007emarketing-85-220-0-3.png/246x0w.jpg")
            }
        }
        set { self.Thumbnail = newValue }
    }
    
    var title: String{
        get { return self.Title }
        set { self.Title = newValue }
    }
    
    var price: String{
        get {
            let temp = self.Price.split(separator: ".")
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
            let formattedTipAmount = formatter.string(from: Double(temp[0])! as NSNumber)
            return "\(formattedTipAmount ?? self.Price!)"
        }
        set { self.Price = newValue }
    }
    
    var location: String{
        get { return self.Location }
        set { self.Location = newValue }
    }
    
}
