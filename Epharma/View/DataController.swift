//
//  DataController.swift
//  Epharma
//
//  Created by Hervé Leka Ndombet on 2022-03-28.
//

import CoreData
import Foundation


class DataController : ObservableObject {
     static let shared = DataController()

     let container: NSPersistentContainer
    
     init(inMemory: Bool = false) {
         container = NSPersistentContainer(name: "Person")
         if inMemory {// pour les previews
         container.persistentStoreDescriptions
        .first!.url = URL(fileURLWithPath: "/dev/null")

         }
         container.loadPersistentStores(completionHandler: { (storeDescription, error) in
         if let error = error as NSError? { fatalError("Unresolved error \(error), \(error.userInfo)")
         }
     })
    }
}
