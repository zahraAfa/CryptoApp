//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 19/12/23.
//

import Foundation

class ServiceManager{
    
    static let shared = ServiceManager()
    
    enum ServiceError: Error{
        case failedToCreateRequest
        case failedToGetData
    }
    
    private init(){
    }
    
//    MARK: - functions
    
    public func execute<T: Codable>(
        _ request: URLRequest?,
        expacting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        guard let urlRequest = request else {
            completion(.failure(ServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? ServiceError.failedToGetData))
                return
            }
            
            do{
                let result = try JSONDecoder().decode(type.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }catch{
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
//            .receive(on: RunLoop.main)
//            .eraseToAnyPublisher()
    }
}
