//
//  CharactersListViewModel.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import Foundation

final class CharactersViewModel<T: Codable>: CharactersListViewModelProtocol, CharactersTableViewProtocol {
    
    var offset: Int
    
    internal var charactersItems: [Character] = []
    
    var charactersService: CharacterServiceProtocol
    
    var isLoading: Bool = false
    
    weak var delagate: CharacterListViewControllerProtocol?

    init(characterService: CharacterServiceProtocol, delagate: CharacterListViewControllerProtocol) {
        self.charactersService = characterService
        self.delagate = delagate
        self.offset = 0
    }
    
    func fetchcharactersItems(count: Int) {
        if count == 0   {
            self.delagate?.changeLoading(value: true)
        }
        charactersService.fetchCharacters(count: count) { [weak self] items in
            guard let self = self, let delagate = self.delagate else { return }
            
            delagate.changeLoading(value: false)
            guard let items = items else {
                return
            }
            if count != 0 {
                self.charactersItems += (items.data?.results)!
                delagate.updateTableView(items: self.charactersItems)
                //delagate.offset = 30
            } else {
                self.charactersItems = (items.data?.results)!
                delagate.updateTableView(items: (items.data?.results)!)
            }
        } onError: { error in
            guard let delagate = self.delagate else { return }
            delagate.changeLoading(value: false)

        }
    }
    
    func fecthCharactersItemNext(count: Int) {
        fetchcharactersItems(count: count)
    }
    
    func addFavorite(item: Character, index: Int) {
        
    }

    func didSelect(item: Character, index: Int) {
        delagate?.navigateToDetail(item: item, selectedIndex: index)
    }
}
