//
//  Network.swift
//  RXProject
//
//  Created by Harish on 27/09/22.
//

import Foundation
import ObjectMapper
import RxSwift

enum Endpoint {
    case facts
    
    func url() -> String {
        switch self {
        case .facts:
            return "https://catfact.ninja/facts"
        }
    }
}

enum ResponseError: Error {
    case nodata
    case failedToMapObject
    
    func errorMessage() -> String {
        switch self {
        case .nodata:
            return "No data found or data is nil"
        case .failedToMapObject:
            return "Failed to map response"
        }
    }
}

protocol NetworkProtocol {
    func request<Response: ImmutableMappable>(endpoint: Endpoint)  -> Single<Response>
}

class Network: NetworkProtocol {
    
    func request<Response: ImmutableMappable>(endpoint: Endpoint)  -> Single<Response> {
        
        guard let url = URL(string: endpoint.url()) else {
            return Single.error(URLError.init(.badURL))
        }
        
        return Single<Response>.create { single in
            
            let disposable = Disposables.create()
            
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                
                    if let error = error {
                    single(.error(error))
                    return
                }
                
                guard let data = data else {
                    single(.error(ResponseError.nodata))
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    let result = try Mapper<Response>().map(JSON: json as! [String : Any])
                    single(.success(result))
                } catch {
                    single(.error(ResponseError.failedToMapObject))
                }
            }
            
            dataTask.resume()
            
            return disposable
        }
    }
    
}
