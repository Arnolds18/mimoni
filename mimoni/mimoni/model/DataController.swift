//
//  DataController.swift
//  mimoni
//
//  Created by ardian kurniawan on 22/07/22.
//

import CoreData

struct DataController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Moneh" )
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error:\(error.localizedDescription)")
            }
        }
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in}){
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
//    func delete(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_
//        in}) {
//        let context = container.viewContext
//        context.delete(object)
//        save(completion: completion)
//    }
    
}
