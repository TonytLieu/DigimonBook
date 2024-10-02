//
//  DigimonNetworkTests.swift
//  DigimonBookTests
//
//  Created by Tony Lieu on 9/24/24.
//

import XCTest
import Combine
@testable import DigimonBook

final class DigimonNetworkTests: XCTestCase {
    var networkMock = Network()
    var digimonEndpoint = ApiEndpoints()
    var digimonData: String?
    var customError: NetworkError?
    var cancelable = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Sucess_apiCall() throws {
        // When
        networkMock.getDigimon(url: URL(string: digimonEndpoint.digimonEndpoint)!, modelType: DigimonBook.self)
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
                // Then
                self?.digimonData = DigimonBook.name
                XCTAssertNotNil(self?.digimonData)
            }.store(in: &cancelable)

    }
    
    func test_badURL_apiCall() throws {
        // When
        networkMock.getDigimon(url: URL(string: "badURl.com")!, modelType: DigimonBook.self)
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
                // Then
                self?.digimonData = DigimonBook.name
                XCTAssertNil(self?.digimonData)
            }.store(in: &cancelable)

    }
}
