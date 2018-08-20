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
        print("SEARCH")
        print(searchBar.text)
    }

}


