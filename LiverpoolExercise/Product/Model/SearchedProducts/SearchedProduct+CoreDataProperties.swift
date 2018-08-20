//
//  SearchedProduct+CoreDataProperties.swift
//  
//
//  Created by Ivan Lopez Ansaldo on 20/08/18.
//
//

import Foundation
import CoreData


extension SearchedProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SearchedProduct> {
        return NSFetchRequest<SearchedProduct>(entityName: "SearchedProduct")
    }

    @NSManaged public var title: String?

}
