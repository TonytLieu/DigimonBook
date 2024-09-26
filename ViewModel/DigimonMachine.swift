//
//  DigimonMachine.swift
//  DigimonBook
//
//  Created by Tony Lieu on 9/23/24.
//

import Foundation
import Combine

class digimonMachine: ObservableObject {
    @Published var digimonBook = [DigimonBook]()
    var networkDigimon = Network()
    var customError:NetworkError?
    var cancelable = Set<AnyCancellable>()
    
    init() {
    }
    
    func getDigimonBook(url: String) {
        networkDigimon.getDigimon(url: URL(string: url)!, modelType: [DigimonBook].self)
            .receive(on: RunLoop.main)
            .sink { complete in
                switch complete {
                case .finished:
                    print("Sucuess")
                case .failure(let error):
                    switch error{
                    case is DecodingError:
                        self.customError = NetworkError.parsingError
                    case NetworkError.serverNotFoundError:
                        self.customError = NetworkError.serverNotFoundError
                    case is URLError:
                        self.customError = NetworkError.urlError
                    case NetworkError.parsingError:
                        self.customError = NetworkError.parsingError
                    default:
                        self.customError = NetworkError.dataNotFound
                    }
                    self.customError = NetworkError.serverNotFoundError
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] DigimonBook in
                self?.digimonBook = DigimonBook
            }.store(in: &cancelable)
    }
}
