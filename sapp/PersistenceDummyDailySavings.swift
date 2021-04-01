//
//  Persistence.swift
//  coredataApp
//
//  Created by Alexandra Mai on 3/27/21.
//

import CoreData

struct PersistenceControllerDummyDailySavings {
    static let shared = PersistenceControllerDummyDailySavings()

    static var preview: PersistenceControllerDummyDailySavings = {
        let result = PersistenceControllerDummyDailySavings(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = DummyDailySavings(context: viewContext)
            newItem.amount = Int16(0)
            newItem.savingType = ""
            newItem.enteredDay = Date()
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
