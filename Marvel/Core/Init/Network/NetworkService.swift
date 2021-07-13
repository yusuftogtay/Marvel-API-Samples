//
//  NetworkService.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 12.07.2021.
//

import Alamofire
import Foundation


final class NetworkService: INetworkService {

    let baseConfig: BaseConfig

    init(config: BaseConfig) {
        self.baseConfig = config
    }


    func fetch<T>(path: String, paramaters: [String: String]?, data: Codable?, method: HTTPMethod, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void) where T: Encodable, T: Decodable, T: Codable {
        AF.request(networkPath(path: path),
                   method: method,
                   parameters: paramaters
        ).validate().responseDecodable(of: T.self)
        { (response) in
            /*if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)")
                }*/
            guard let model = response.value else {

                if StatusCodes.isSuccess(val: response.response?.statusCode ?? StatusCodes.notFound.rawValue) {
                    onSuccess(BaseResponse(model: nil, message: "Succes but doesnt have model"))
                }
                onError(BaseError(response.error))
                print(response.error as Any)
                return
            }
            onSuccess(BaseResponse.init(model: model, message: "Success"))
        }
    }
}

/*
 
 .responseData { response in
     switch response.result {
     case .success:
         let charactersResponse = try! JSONDecoder().decode(T.self, from: response.data!)
         onSuccess(BaseResponse.init(model: charactersResponse, message: "Success"))
     case let .failure(error):
         print(error)
         onError(BaseError(response.error))
     }
 }
 */


/*
 
 .responseDecodable(of: T.self)
 { (response) in
     guard let model = response.value else {

         if StatusCodes.isSuccess(val: response.response?.statusCode ?? StatusCodes.notFound.rawValue) {
             onSuccess(BaseResponse(model: nil, message: "Succes but doesnt have model"))
         }
         onError(BaseError(response.error))
         return
     }
     onSuccess(BaseResponse.init(model: model, message: "Success"))
 }
 */
