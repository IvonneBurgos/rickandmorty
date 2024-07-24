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
        VStack {
            ProfileCard(character: character)
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.custom("GREENFUZ",size:46)).foregroundStyle(Color("Brown"))
                HStack {
                    Text(character.origin.name)
                    Spacer()
                    Text(character.location.name)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()
                Text("About the character")
                    .font(.title2).padding(.bottom).foregroundStyle(Color("Brown"))

                DescriptionItem(title: "Status", description: character.status)
                DescriptionItem(title: "Gender", description: character.gender)
                DescriptionItem(title: "Species", description: character.species)
                DescriptionItem(title: "Total episodies", description: "\(character.episode.count)")
            }
            .padding()
            Spacer()
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        let character = Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [ "https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2",], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
        DescriptionView(character: character)
    }
}

