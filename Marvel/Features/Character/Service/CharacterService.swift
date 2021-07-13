//
//  CharacterService.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import Alamofire

final class CharacterService: CharacterServiceProtocol, NetworkManagerProtocol {
    
    func fetchComis(id: String, onSuccess: @escaping (ComicsResponse?) -> Void, onError: @escaping (BaseError?) -> Void) {
        let parameters: Dictionary<String, String> = [
            "apikey": ApplicationConstants.PUBLIC_KEY,
            "ts": "1",
            "hash": service.hash(publicKey: ApplicationConstants.PUBLIC_KEY, privateKey: ApplicationConstants.PRIVATE_KEY, timeStamp: "1"),
            "orderBy": "onsaleDate",
            "startYear": "2005",
            "limit": "10"
        ]
        
        service.fetch(path: "\(NetworkPath.CHARACTERS.rawValue)/\(id)\(NetworkPath.COMICS.rawValue)", paramaters: parameters, data: nil, method: HTTPMethod.get) { (response: BaseResponse<ComicsResponse>) in
            onSuccess(response.model)
        } onError: { (error) in
            print(error)
            onError(error)
        }
    }
    
    
    func fetchCharacters(count: Int = 30, onSuccess: @escaping (CharactersResponse?) -> Void, onError: @escaping (BaseError?) -> Void) {
        
        let parameters: Dictionary<String, String> = [
            "apikey": ApplicationConstants.PUBLIC_KEY,
            "ts": "1",
            "hash": service.hash(publicKey: ApplicationConstants.PUBLIC_KEY, privateKey: ApplicationConstants.PRIVATE_KEY, timeStamp: "1"),
            "limit": "30",
            "offset": "\(count)"
        ]
        
        service.fetch(path: NetworkPath.CHARACTERS.rawValue, paramaters: parameters, data: nil, method: HTTPMethod.get) { (response: BaseResponse<CharactersResponse>) in
            onSuccess(response.model)
        } onError: { (error) in
            print(error)
            onError(error)
        }
    }
    
    func fetchCharacter(id: String, onSuccess: @escaping (CharactersResponse?) -> Void, onError: @escaping (BaseError?) -> Void) {
        let parameters: Dictionary<String, String> = [
            "apikey": ApplicationConstants.PUBLIC_KEY,
            "ts": "1",
            "hash": service.hash(publicKey: ApplicationConstants.PUBLIC_KEY, privateKey: ApplicationConstants.PRIVATE_KEY, timeStamp: "1"),
        ]
        
        service.fetch(path: "\(NetworkPath.CHARACTERS.rawValue)/\(id)", paramaters: parameters, data: nil, method: HTTPMethod.get) { (response: BaseResponse<CharactersResponse>) in
            onSuccess(response.model)
        } onError: { (error) in
            print(error)
            onError(error)
        }
    }
}


