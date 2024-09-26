//
//  DigimonBookError.swift
//  DigimonBookTests
//
//  Created by Tony Lieu on 9/24/24.
//

import XCTest
@testable import DigimonBook

final class DigimonBookModelTests: XCTestCase {

    func testDigimonBookDecoding() throws {
        let jsonData = """
        {
            "name": "Agumon",
            "img": "https://example.com/agumon.png",
            "level": "Rookie"
        }
        """.data(using: .utf8)!
        
        // When
        let decodedDigimon = try JSONDecoder().decode(DigimonBook.self, from: jsonData)
        
        // Then
        XCTAssertEqual(decodedDigimon.name, "Agumon")
        XCTAssertEqual(decodedDigimon.img, "https://example.com/agumon.png")
        XCTAssertEqual(decodedDigimon.level, "Rookie")
    }

    func testDigimonBookDecodingWithMissingOptionalFields() throws {
        // Given
        let jsonData = """
        {
            "name": "Gabumon"
        }
        """.data(using: .utf8)!
        
        // When
        let decodedDigimon = try JSONDecoder().decode(DigimonBook.self, from: jsonData)
        
        // Then
        XCTAssertEqual(decodedDigimon.name, "Gabumon")
        XCTAssertNil(decodedDigimon.img)
        XCTAssertNil(decodedDigimon.level)
    }

    func testDigimonBookDecodingWithInvalidData() {
        // Given
        let invalidJsonData = """
        {
            "name": 1234,
            "img": 5678,
            "level": true
        }
        """.data(using: .utf8)!
        
        // When & Then:
        XCTAssertThrowsError(try JSONDecoder().decode(DigimonBook.self, from: invalidJsonData)) { error in
            print("Decoding failed as expected with error: \(error)")
        }
    }
}
