//
//  ProductViewController.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/19/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController{
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSearchController()
        
    }
    
    func setupSearchController(){
        // Setup the Search Controller
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.862745098, green: 0.09019607843, blue: 0.5843137255, alpha: 1)
        let textAttributes = [NSAttributedStringKey.foregroundColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "Liverpool"


        
        if #available(iOS 11.0, *) {
            let sc = UISearchController(searchResultsController: nil)
            sc.delegate = self
//            sc.searchResultsUpdater = self
            sc.searchBar.delegate = self
            let scb = sc.searchBar
            scb.tintColor = UIColor.white
            scb.barTintColor = UIColor.white

            if let textfield = scb.value(forKey: "searchField") as? UITextField {
                if let backgroundview = textfield.subviews.first {

                    // Background color
                    backgroundview.backgroundColor = UIColor.white

                    // Rounded corner
                    backgroundview.layer.cornerRadius = 10;
                    backgroundview.clipsToBounds = true;
                }
            }
            
            sc.obscuresBackgroundDuringPresentation = false
            sc.hidesNavigationBarDuringPresentation = false
            sc.searchBar.placeholder = "Search Products"
            
            navigationItem.searchController = sc
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
}
