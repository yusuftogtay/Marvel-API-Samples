//
//  CharatersListViewControllerProtocol.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

protocol CharacterListViewControllerProtocol: AnyObject {
    func changeLoading(value: Bool)
    func updateTableView(items: [Character])
    func navigateToDetail(item: Character, selectedIndex: Int)
    func navigateToFavorite()
}
