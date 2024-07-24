//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 20/7/24.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    
    @StateObject private var viewModel = CharacterViewModel()

    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(viewModel)
        }
    }
}
