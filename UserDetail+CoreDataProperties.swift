//
//  UserDetail+CoreDataProperties.swift
//  Project Management
//
//  Created by Ayush Bharadwaj on 28/02/23.
//
//

import Foundation
import CoreData


extension UserDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetail> {
        return NSFetchRequest<UserDetail>(entityName: "UserDetail")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var department: String?

}

extension UserDetail : Identifiable {

}
