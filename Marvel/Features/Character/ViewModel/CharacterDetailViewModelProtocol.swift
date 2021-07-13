//
//  CharacterDetailViewModelProtocol.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 13.07.2021.
//

import Foundation

protocol CharacterDetailListViewModelProtocol {
    associatedtype T
    var isLoading: Bool { get }
    var character: T { get }
    var charactersService: CharacterServiceProtocol { get }
    func fetchcharacter(id: String)
}
