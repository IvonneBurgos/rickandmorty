//
//  MainView.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 23/7/24.
//

import SwiftUI


struct MainView: View {
    
    init() {
            // Set the appearance of the tab bar background
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Color("Brown"))
            
            // Customize the normal tab bar item appearance
            let itemAppearance = UITabBarItemAppearance()
            itemAppearance.normal.iconColor = UIColor.white
            itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
            itemAppearance.selected.iconColor = UIColor(Color("Green"))
            itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color("Green"))]
            
            appearance.stackedLayoutAppearance = itemAppearance
            appearance.inlineLayoutAppearance = itemAppearance
            appearance.compactInlineLayoutAppearance = itemAppearance
            
            UITabBar.appearance().standardAppearance = appearance
            
            // For iOS 15 and later, use the scrollEdgeAppearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
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
