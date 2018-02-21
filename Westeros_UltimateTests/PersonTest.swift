//
//  CharacterTest.swift
//  Westeros_UltimateTests
//
//  Created by Manuel Perez Soriano on 20/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import XCTest
@testable import Westeros_Ultimate

class PersonTest: XCTestCase {
    
    var starkHouse: House!
    var starkSigil: Sigil!
    var ned: Person!
    var arya: Person!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence() {
        XCTAssertNotNil(ned)
        XCTAssertNotNil(arya)
    }
    
    func testPersonFullName() {
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
}
