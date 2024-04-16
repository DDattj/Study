//
//  Detail+CoreDataProperties.swift
//  wishList
//
//  Created by 이시안 on 4/14/24.
//
//

import Foundation
import CoreData


extension Detail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Detail> {
        return NSFetchRequest<Detail>(entityName: "Detail")
    }

    @NSManaged public var id: Int64
    @NSManaged public var stock: Int64
    @NSManaged public var category: String?
    @NSManaged public var brand: String?
    @NSManaged public var attribute: NSObject?
    @NSManaged public var preview: ViewController?

}

extension Detail : Identifiable {

}
