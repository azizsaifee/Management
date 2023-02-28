//
//  DataBaseHandler.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 27/02/23.
//

import Foundation
import CoreData
import UIKit

class DataBaseHandler {
    
//
//    func fetchSearchedData(questionNo:String) -> [Questions]
//    {
//
//        var sdata = [Questions]()
//let predicate = NSPredicate(format: "questionNo CONTAINS[cd] %@ OR question CONTAINS[cd] %@ OR option1 CONTAINS[cd] %@ OR option2 CONTAINS[cd] %@ OR option3 CONTAINS[cd] %@ OR option4 CONTAINS[cd] %@" , questionNo,questionNo,questionNo,questionNo,questionNo,questionNo)
//        let context = PersistentStorage.shared.context
//        let request:NSFetchRequest = Questions.fetchRequest()
//        request.predicate = predicate
//        do{
//            sdata = try(context.fetch(request))
//        }
//        catch{
//            print("error")
//        }
//        return sdata
//    }
    
    func fetchSearchedData(searchText: String) -> [Questions] {
        var sdata = [Questions]()
        let context = PersistentStorage.shared.context
        let request: NSFetchRequest<Questions> = Questions.fetchRequest()
        let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [
            NSPredicate(format: "questionNo CONTAINS[c] %@", searchText),
            NSPredicate(format: "AppCoreData.property CONTAINS[c] %@", searchText),
            //NSPredicate(format: "UserDetail.property CONTAINS[c] %@", searchText)
        ])
        request.predicate = predicate
        do {
            sdata = try context.fetch(request)
        } catch {
            print("Error fetching searched data: \(error.localizedDescription)")
        }
        return sdata
    }

}
