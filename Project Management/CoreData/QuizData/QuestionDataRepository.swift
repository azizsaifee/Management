//
//  QuestionDataRepository.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//

import Foundation
import CoreData

protocol DataRepositorys {
    func create(data: Document)
    func get(byIdentifier questionNo: Int16) -> Document?
//    func getAll() -> [Document]?
    func delete(byIdentifier questionNo: Int16) -> Bool
}

struct AppDataRepositorys: DataRepositorys {

    func create(data: Document) {
        let entity = Questions(context: PersistentStorage.shared.context)
        // Here we can set this as uniqueID.
        entity.questionNo = data.questionNo
        entity.question = data.question
        entity.option1 = data.option1
        entity.option2 = data.option2
        entity.option3 = data.option3
        entity.option4 = data.option4
        entity.answer = data.answer
        PersistentStorage.shared.saveContext()
    }
    
    func get(byIdentifier questionNo: Int16) -> Document? {
        let data = getData(byIdentifier: "\(questionNo)")
        
        guard data != nil else {return nil}
        
        return data?.convert()
    }
    
    func getData(byIdentifier questionNo: String) -> Questions?
    {
        let fetchRequest = NSFetchRequest<Questions>(entityName: "Questions")
        let predicate = NSPredicate(format: "questionNo==%@", questionNo)

        fetchRequest.predicate = predicate
        do {
            let entity = try PersistentStorage.shared.context.fetch(fetchRequest).first

            guard entity != nil else {return nil}

            return entity

        } catch let error {
            debugPrint(error)
        }
        return nil
    }
//
//    func getAll() -> [Document]? {
//        let data = PersistentStorage.shared.fetchManagedObject(managedObject: Questions.self)
//        var array : [Document] = []
//
//        data?.forEach({ AppBasedData in
//            array.append(AppBasedData.convert())
//        })
//        return array
//
//    }
//
    func delete(byIdentifier questionNo: Int16) -> Bool {
        let data = getData(byIdentifier: "\(questionNo)")

        guard data != nil else {return false}

        PersistentStorage.shared.context.delete(data!)
        PersistentStorage.shared.saveContext()

        return true
    }
}



