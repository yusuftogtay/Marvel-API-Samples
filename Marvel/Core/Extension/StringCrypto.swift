//
//  StringCrypto.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import Foundation
import CryptoKit

extension String {
    var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}
