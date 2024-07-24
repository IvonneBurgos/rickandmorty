//
//  MainView.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 23/7/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem { Label ("List", systemImage: "list.dash" )}
            CarouselView().tabItem { Label( "Carousel", systemImage:"circle.grid.2x1.left.filled") }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(CharacterViewModel())
    }
}
