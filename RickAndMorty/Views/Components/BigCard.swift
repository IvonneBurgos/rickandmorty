//
//  CharacterCard.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 21/7/24.
//

import SwiftUI

struct BigCard: View {
    let character: Character
    var body: some View {
        NavigationLink(destination: DescriptionView(character: character)){
            VStack(alignment: .center) {
                Text(character.name)
                    .font(.custom("GREENFUZ", size: 36)).foregroundStyle(.green)
                imageCard
            }.roundedCorner(20, corners: [.topLeft, .bottomRight]).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        
    }
    
    var imageCard: some View {
        AsyncImage(url: URL(string: character.image)){
            image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
        } placeholder: {
            ProgressView().frame(width: 250, height: 250)
        }
    }
}


struct BigCard_Previews: PreviewProvider {
    static var previews: some View {
        let character = Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [ "https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2",], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
        BigCard(character: character)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}



