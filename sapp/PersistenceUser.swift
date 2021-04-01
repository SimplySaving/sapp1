//
//  Persistence.swift
//  coredataApp
//
//  Created by Alexandra Mai on 3/27/21.
//

import CoreData

struct PersistenceControllerUser {
    static let shared = PersistenceControllerUser()

    static var preview: PersistenceControllerUser = {
        let result = PersistenceControllerUser(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = User(context: viewContext)
            newItem.username = ""
            newItem.password = ""
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "sapp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
