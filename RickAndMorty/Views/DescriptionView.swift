//
//  DescriptionView.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 23/7/24.
//

import SwiftUI

struct DescriptionView: View {
    let character : Character
    var body: some View {
        ScrollView {
            VStack {
                ProfileCard(character: character)
            }
            
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray5))
        
    }
}

