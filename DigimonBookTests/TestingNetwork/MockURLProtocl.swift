//
//  MockURLProtocl.swift
//  DigimonBookTests
//
//  Created by Tony Lieu on 9/24/24.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var testData: Data?
    static var testError: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.testError {
            self.client?.urlProtocol(self, didFailWithError: error)
        } else if let data = MockURLProtocol.testData {
            self.client?.urlProtocol(self, didLoad: data)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
