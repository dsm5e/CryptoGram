//
//  NetworkingManager.swift
//  CryptoGram
//
//  Created by dsm 5e on 18.09.2023.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badUrlResponse(url: URL)
        case rateLimits
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badUrlResponse(url: let url): return "[🥵] Bad response from URL: \(url)"
            case .rateLimits: return "You've exceeded the Rate Limit"
            case .unknown: return "[🫡] Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return  URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleResponse(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            if let response = output.response as? HTTPURLResponse, response.statusCode == 429 {
                throw NetworkingError.rateLimits
            }
            throw NetworkingError.badUrlResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
