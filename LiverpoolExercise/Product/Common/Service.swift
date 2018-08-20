//
//  Service.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/19/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import Alamofire
import SwiftyJSON

class Service {
    
    func fetchData_alamofire(criterio:String, completion: @escaping ([ProductModel]) -> ()){
        
        var products = [ProductModel]()
        
        let url = "https://www.liverpool.com.mx/tienda?s=\(criterio)&d3106047a194921c01969dfdec083925=json"
        
        Alamofire.request(url).responseJSON { (response) in
//            print("Alamofire response: \(response)")
            
            let json = JSON(response.data!)
            let records = json["contents"][0]["mainContent"][3]["contents"][0]["records"]
            print(records.count)
            
            for record in records{
                let title = record.1["attributes"]["product.displayName"][0].stringValue
                let thumbnail = record.1["attributes"]["product.smallImage"][0].url
                let price = record.1["attributes"]["sku.list_Price"][0].stringValue
                
                let product = ProductModel(thumbnail: thumbnail!, title: title, price: price, location: "Liverpool")
                products.append(product)
            }
            
            completion(products)
            
        }
    }

    
}

extension Service: MyServiceDelegate{
    func getImageData(with url: URL, completion: @escaping (Data) -> ()) {
        Alamofire.request(url).responseData { (response) in
            if response.error == nil{
                if let data = response.data{
                    completion(data)
                }
            }
        }
    }
}
