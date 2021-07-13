//
//  CharacterDetailViewModel.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 13.07.2021.
//

import Foundation

final class CharacterDetailViewModel<T: Codable>: CharacterDetailListViewModelProtocol  {
    
    var charactersService: CharacterServiceProtocol
    
    var isLoading: Bool = false
    
    internal var character: Character?
    
    internal var comics: [ComicsDetail]?
    
    weak var delagate: CharacterDetailViewControllerProtocol?
    
    init(characterService: CharacterServiceProtocol, delagate: CharacterDetailViewControllerProtocol) {
        self.charactersService = characterService
        self.delagate = delagate
    }

    
    func fetchcharacter(id: String) {
        self.delagate?.changeLoading(value: true)
        charactersService.fetchCharacter(id: "\(id)"){ [weak self] items in
            guard let self = self, let delagate = self.delagate else { return }
            
            delagate.changeLoading(value: false)
            guard let items = items else {
                print("error")
                return
            }
            //print(items.data?.results![0])
            self.character = (items.data?.results![0])!
            delagate.update(items: self.character!)
        } onError: { error in
            print(error?.errorMessage as Any)
            guard let delagate = self.delagate else { return }
            delagate.changeLoading(value: false)
        }
    }
    
    func fetchComics(id: String)  {
        self.delagate?.changeLoading(value: true)
        charactersService.fetchComis(id: "\(id)"){ [weak self] items in
            guard let self = self, let delagate = self.delagate else { return }
            
            delagate.changeLoading(value: false)
            guard let items = items else {
                print("error")
                return
            }
            self.comics = (items.data?.results)!
            delagate.updateTableView(items: self.comics!)
        } onError: { error in
            print(error?.errorMessage as Any)
            guard let delagate = self.delagate else { return }
            delagate.changeLoading(value: false)
        }
    }
    
}
