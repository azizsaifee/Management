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
    
    static var sdata = [Questions]()
    static var adata = [AppCoreData]()
    
    // MARK
    static func fetchSearchedData(questionNo: String) -> [Any]?
    {
        let predicate = NSPredicate(format: "questionNo CONTAINS[cd] %@ OR question CONTAINS[cd] %@ OR option1 CONTAINS[cd] %@ OR option2 CONTAINS[cd] %@ OR option3 CONTAINS[cd] %@ OR option4 CONTAINS[cd] %@" , questionNo,questionNo,questionNo,questionNo,questionNo,questionNo)
        let predicate2 = NSPredicate(format: "id CONTAINS[cd] %@", questionNo)
        let context = PersistentStorage.shared.context
        let request:NSFetchRequest = Questions.fetchRequest()
        let request2:NSFetchRequest = AppCoreData.fetchRequest()
        request.predicate = predicate
        request2.predicate = predicate2
        do {
            sdata = try context.fetch(request)
            adata = try context.fetch(request2)
            return sdata + adata
        } catch {
            print("Error fetching data: \(error)")
            return nil
        }
    }
}
