//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Ivonne Burgos on 20/7/24.
//


import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var errorMessage: String? = nil
    @Published var isEnded = false
    private var currentPage = 1
    private var isLoading = false
    private let itemsPerPage = 20
    private var cancellables = Set<AnyCancellable>()
    
    
    func fetchCharacters() {
        
        guard !isLoading else { return }
        isLoading = true
        
        let api = ProcessInfo.processInfo.environment
        let rickAndMortyCharactersApi = api["API_URL"] ?? "https://rickandmortyapi.com/api/"
        
        guard let url = URL(string: "\(rickAndMortyCharactersApi)character?page=\(currentPage)") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CharacterList.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    print(error)
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] characters in
                self?.characters.append(contentsOf: characters.results)
                self?.currentPage += 1
                self?.isEnded = characters.info.next == nil
            })
            .store(in: &cancellables)
    }
}
