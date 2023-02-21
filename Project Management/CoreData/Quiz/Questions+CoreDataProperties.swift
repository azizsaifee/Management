//
//  Questions+CoreDataProperties.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//
//

import Foundation
import CoreData


extension Questions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Questions> {
        return NSFetchRequest<Questions>(entityName: "Questions")
    }

    @NSManaged public var questionNo: Int16
    @NSManaged public var question: String?
    @NSManaged public var option1: String?
    @NSManaged public var option2: String?
    @NSManaged public var option3: String?
    @NSManaged public var option4: String?
    
    func convert() -> Document{
        return Document(questionNo: Int16(questionNo.self), question: question!.self, option1: option1!.self, option2: option2!.self, option3: option3!.self, option4: option4!.self)
    }
}

extension Questions : Identifiable {

}
