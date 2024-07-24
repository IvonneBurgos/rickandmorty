//
//  CarouselView.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 21/7/24.
//

import SwiftUI
import Foundation

struct CarouselView: View {
    @EnvironmentObject var viewModel: CharacterViewModel
    @State private var startAnimation: Bool = false
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [
                        Color("Yellow"),
                        Color("Peach"),
                        Color("Pink")],
                    startPoint: startAnimation ? .topLeading : .bottomLeading,
                    endPoint: startAnimation ? .bottomTrailing : .topTrailing
                )
                .onAppear {
                    withAnimation(.linear(duration: 5.0).repeatForever()) {
                        startAnimation.toggle()
                    }
                }
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        ForEach(viewModel.characters) { item in
                            BigCard(character: item)
                                .frame(width: geometry.size.width)
                        }
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                    .offset(x: -CGFloat(currentIndex) * geometry.size.width + dragOffset)
                    .animation(.spring(), value: dragOffset)
                    .animation(.spring(), value: currentIndex)
                    .gesture(
                        DragGesture()
                            .updating($dragOffset, body: { value, state, _ in
                                state = value.translation.width
                            })
                            .onEnded { value in
                                
                                let threshold = geometry.size.width / 2
                                var newIndex = currentIndex
                                
                                if value.predictedEndTranslation.width < -threshold {
                                    newIndex = min(currentIndex + 1, viewModel.characters.count - 1)
                                    
                                } else if value.predictedEndTranslation.width > threshold {
                                    
                                    newIndex = max(currentIndex - 1, 0)
                                }
                                currentIndex = newIndex
                                
                                if newIndex == viewModel.characters.count - 1 && !viewModel.isEnded {
                                    print("dataaa \(newIndex)")
                                    viewModel.fetchCharacters()
                                }
                            }
                    )
                }
                .frame(height: 200)
                .onAppear {
                    if (viewModel.characters.count == 0){
                        viewModel.fetchCharacters()
                    }
                }
            }
            .ignoresSafeArea()
            
        }.accentColor(Color("Green"))
    }
}
