//
//  sappApp.swift
//  sapp
//
//  Created by Alexandra Mai on 3/12/21.
//
//
import SwiftUI
import CoreData


@main
struct sappApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyApplication")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    var body: some Scene {
        WindowGroup {
            beginning(viewRouter: viewRouter)
        }
    }
}

class PersistenceManager {
  let persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "MyApplication")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()
}
