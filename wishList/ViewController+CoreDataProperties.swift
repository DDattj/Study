//
//  ViewController+CoreDataProperties.swift
//  wishList
//
//  Created by 이시안 on 4/14/24.
//
//

import Foundation
import CoreData


extension ViewController {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ViewController> {
        return NSFetchRequest<ViewController>(entityName: "Preview")
    }

    @NSManaged public var discountPercentage: Double
    @NSManaged public var price: Int64
    @NSManaged public var ranking: Int32
    @NSManaged public var title: String?

}

extension ViewController : Identifiable {

}
