//
//  ProductRecordsViewController.swift
//  LiverpoolExercise
//
//  Created by Ivan Lopez Ansaldo on 8/20/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit

class ProductRecordsViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var productViewModel : ProductViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 120
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
}

extension ProductRecordsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productViewModel.getNumbersOfProducts()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        
        let product = productViewModel.fetchProduct(at: indexPath.row)
        cell.set(product: product)
        
        return cell
        
    }

}
