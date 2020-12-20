//
//  Comp+CoreDataProperties.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//
//

import Foundation
import CoreData


extension Comp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comp> {
        return NSFetchRequest<Comp>(entityName: "Comp")
    }

    @NSManaged public var name: String
    @NSManaged public var firstMate: String
    @NSManaged public var secondMate: String
    @NSManaged public var thirdMate: String
    @NSManaged public var rating: Int16

}

extension Comp : Identifiable {

}
