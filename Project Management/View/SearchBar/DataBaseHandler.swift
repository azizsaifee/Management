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
    
    
    func fetchSearchedData(questionNo:String) -> [Questions]
    {
        
        var sdata = [Questions]()
        let predicate = NSPredicate(format: "questionNo==%@", questionNo)
        let context = PersistentStorage.shared.context
        let request:NSFetchRequest = Questions.fetchRequest()
        request.predicate = predicate
        do{
            sdata = try(context.fetch(request))
        }
        catch{
            print("error")
        }
        return sdata
    }
    
}
