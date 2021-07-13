//
//  CharatersTableViewProtocol.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import UIKit

protocol CharactersTableViewProtocol {
    func addFavorite(item: Character, index: Int)
    func didSelect(item:Character, index: Int)
    func fecthCharactersItemNext(count: Int)
    var offset: Int { get set }
}
