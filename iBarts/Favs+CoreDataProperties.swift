//
//  Favs+CoreDataProperties.swift
//  iBArts_Project
//
//  Created by Sagar Bhosale on 23/05/2022.
//
//

import Foundation
import CoreData


extension Favs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favs> {
        return NSFetchRequest<Favs>(entityName: "Favs")
    }

    @NSManaged public var title: String?

}

extension Favs : Identifiable {

}
