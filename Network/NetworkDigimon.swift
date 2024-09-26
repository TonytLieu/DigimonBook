//
//  NetworkDigimon.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/23/24.
//

import Foundation
import Combine

protocol DigimonNetwork {
    func getDigimon<T: Decodable>(url: URL, modelType: T.Type) -> AnyPublisher<T, Error>
}

class Network: DigimonNetwork {
    func getDigimon<T>(url: URL, modelType: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
