//
//  CharacterDetailViewControllerProtocol.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 13.07.2021.
//

protocol CharacterDetailViewControllerProtocol: AnyObject {
    func changeLoading(value: Bool)
    func updateTableView(items: [ComicsDetail])
    func update(items: Character)
    //func navigateToFavorite()
}
