//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 20/7/24.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
