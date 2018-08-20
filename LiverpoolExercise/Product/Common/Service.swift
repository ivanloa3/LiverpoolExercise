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
    
    func fetchData_alamofire(completion: @escaping ([ProductModel]) -> ()){
        
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
