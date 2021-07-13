//
//  CharactersListViewModelProtocol.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import Foundation

protocol CharactersListViewModelProtocol {
    associatedtype T
    var isLoading: Bool { get }
    var charactersItems: [T] { get }
    var charactersService: CharacterServiceProtocol { get }
    func fetchcharactersItems(count: Int)
}
