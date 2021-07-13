//
//  NetworkManagerProtocol.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

protocol NetworkManagerProtocol {
    var service: INetworkService { get }
}


extension NetworkManagerProtocol {
    var service: INetworkService {
        return NetworkService(config: ApplicationConstants.BASE_CONFIG)
    }
}
