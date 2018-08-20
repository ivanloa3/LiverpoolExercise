//
//  SearchedProductTableViewCell.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/20/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit

class SearchedProductTableViewCell : UITableViewCell{
    
    @IBOutlet weak var title: UILabel!
    
    func set(title:String){
        self.title.text = title
    }

}
