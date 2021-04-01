//
//  sappApp.swift
//  sapp
//
//  Created by Alexandra Mai on 3/12/21.
//
// sappApp.swift boots up the initial view of beginning.swift

import SwiftUI
import CoreData

@main
struct sappApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    let persistenceControllerUser = PersistenceControllerUser.shared
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "sapp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    var body: some Scene {
        WindowGroup {
            // the beginning view will be initiated
            beginning(viewRouter: viewRouter)
                .environment(\.managedObjectContext, persistenceControllerUser.container.viewContext)
        }
    }
}

class PersistenceManager {
  let persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "sapp")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()
}
