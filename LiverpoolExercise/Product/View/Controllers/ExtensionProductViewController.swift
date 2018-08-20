//
//  ExtensionProductViewController.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/19/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit



extension ProductViewController: UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        print("SEARCH")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("CANCEL")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("UPDATE")
        searchController.searchBar.setShowsCancelButton(true, animated: true)
    }
}


