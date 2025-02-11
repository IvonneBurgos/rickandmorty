//
//  RowCard.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 23/7/24.
//

import SwiftUI

struct RowCard: View {
    let character : Character
    var body: some View {
        NavigationLink(destination: DescriptionView(character: character)){
            LazyHStack{
                AsyncImage(url: URL(string: character.image)){
                    image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100).roundedCorner(50, corners: [.topRight, .bottomRight])
                } placeholder: {
                    ProgressView().frame(width: 100, height: 100)
                }
                LazyVStack(alignment: .leading){
                    Text(character.name).font(.headline).multilineTextAlignment(.leading).lineLimit(1).padding(.horizontal, 0.0).truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                    Text(character.species).font(.caption)
                }
            }
        }
    }
}

struct RowCard_Previews: PreviewProvider {
    static var previews: some View {
        let character = Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [ "https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2",], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
        RowCard(character: character)
    }
}
