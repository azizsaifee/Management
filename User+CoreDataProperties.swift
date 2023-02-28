//
//  User+CoreDataProperties.swift
//  Project Management
//
//  Created by Ayush Bharadwaj on 28/02/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var department: String?

}

extension User : Identifiable {

}
