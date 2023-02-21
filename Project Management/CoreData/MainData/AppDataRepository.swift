//
//  AppDataRepository.swift
//  Project Management
//
//  Created by Apple on 13/02/23.
//

import Foundation
import CoreData

protocol DataRepository {
    func create(data: DataDictionary)
    func get(byIdentifier id: String) -> DataDictionary?
    func getAll() -> [DataDictionary]?
    func delete(byIdentifier id: String) -> Bool
}


struct AppDataRepository: DataRepository {
    func create(data: DataDictionary) {
        let entity = AppCoreData(context: PersistentStorage.shared.context)
        entity.id = data.id
        entity.credentials = data.credentials
        entity.issues = data.issues
        entity.documentation = data.documentation
        entity.features = data.features
        
        PersistentStorage.shared.saveContext()
    }
    
    func get(byIdentifier id: String) -> DataDictionary? {
        let data = getData(byIdentifier: id)
        
        guard data != nil else {return nil}
        
        return data?.convert()
    }
    
    func getData(byIdentifier id: String) -> AppCoreData?
    {
        let fetchRequest = NSFetchRequest<AppCoreData>(entityName: "AppCoreData")
       
        
        let predicate = NSPredicate(format: "id==%@", id)
        
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
    
    func getAll() -> [DataDictionary]? {
        let data = PersistentStorage.shared.fetchManagedObject(managedObject: AppCoreData.self)
        var array : [DataDictionary] = []
        
        data?.forEach({ AppBasedData in
            array.append(AppBasedData.convert())
        })
        return array
        
    }
    
    func delete(byIdentifier id: String) -> Bool {
        let data = getData(byIdentifier: id)
        
        guard data != nil else {return false}
        
        PersistentStorage.shared.context.delete(data!)
        PersistentStorage.shared.saveContext()
        
        return true
    }
}
