//
//  CharacterServiceProtocol.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

protocol CharacterServiceProtocol   {
    func fetchCharacters(count: Int,onSuccess: @escaping (CharactersResponse?) -> Void, onError: @escaping (BaseError?) -> Void)
    
    func fetchCharacter(id: String ,onSuccess: @escaping (CharactersResponse?) -> Void, onError: @escaping (BaseError?) -> Void)
    
    func fetchComis(id: String ,onSuccess: @escaping (ComicsResponse?) -> Void, onError: @escaping (BaseError?) -> Void)
}
