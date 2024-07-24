//
//  DescriptionItem.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 24/7/24.
//

import SwiftUI

struct DescriptionItem: View {
    let title: String
    let description: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(description)
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
    }
}

