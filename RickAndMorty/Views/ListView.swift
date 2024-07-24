//
//  ListView.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 20/7/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: CharacterViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                RowCard(character: character)
                    .onAppear {
                        if (character.id == viewModel.characters.last?.id) {
                        viewModel.fetchCharacters()
                    }
                }
            }
            .navigationTitle("Rick & Morty")
            .onAppear {
                if (viewModel.characters.count == 0 ){
                    viewModel.fetchCharacters()
                }
            }
        }
    }
}

