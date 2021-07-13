//
//  NetworkExtension.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import Foundation

extension INetworkService {
    
    func hash(publicKey: String, privateKey: String, timeStamp: String) -> String   {
        return "\(timeStamp)\(privateKey)\(publicKey)".MD5
    }
}
