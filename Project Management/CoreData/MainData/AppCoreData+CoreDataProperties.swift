//
//  AppCoreData+CoreDataProperties.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//
//

import Foundation
import CoreData


extension AppCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppCoreData> {
        return NSFetchRequest<AppCoreData>(entityName: "AppCoreData")
    }

    @NSManaged public var credentials: Credentials?
    @NSManaged public var documentation: Documentation?
    @NSManaged public var features: Features?
    @NSManaged public var id: String?
    @NSManaged public var issues: Issues?

    func convert() -> DataDictionary{
        return DataDictionary(id: id!.self, features: features!.self, documentation: documentation!.self, issues: issues!.self, credentials: credentials!.self)
    }
}
extension AppCoreData : Identifiable {

}
