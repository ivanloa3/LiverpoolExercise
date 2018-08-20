//
//  ProductTableViewCell.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/19/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit

protocol MyServiceDelegate {
    func getImageData(with url: URL,completion: @escaping (Data) -> ())
}

class ProductTableViewCell: UITableViewCell{
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var location: UILabel!
    
    var delegate : MyServiceDelegate = Service()
    
    func set(image: URL, title: String, price: String, location:String){
        delegate.getImageData(with: image) { (data) in
            DispatchQueue.main.async {
                self.thumbnail.image = UIImage(data: data)
                
                self.title.text = title
                self.price.text = price
                self.location.text = location
            }
        }
    }
    
    func set(title: String, price: String, location: String){
        self.title.text = title
        self.price.text = price
        self.location.text = location
    }
    
    func set(product: ProductModel){

        delegate.getImageData(with: product.thumbnail) { (data) in
            DispatchQueue.main.async {
                self.thumbnail.image = UIImage(data: data)
                
                self.title.text = product.title
                self.price.text = product.price
                self.location.text = product.location
            }
        }
    }
    
}
