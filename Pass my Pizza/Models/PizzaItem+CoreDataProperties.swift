//
//  PizzaItem+CoreDataProperties.swift
//  Pass my Pizza
//
//  Created by Athul Babu on 2022-08-17.
//
//

import Foundation
import CoreData


extension PizzaItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PizzaItem> {
        return NSFetchRequest<PizzaItem>(entityName: "PizzaItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Int64
    @NSManaged public var topings: [String]?
    @NSManaged public var size: String?
    @NSManaged public var crust: String?

}

extension PizzaItem : Identifiable {

}
