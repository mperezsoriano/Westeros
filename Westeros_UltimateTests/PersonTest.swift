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
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
    
    override func setUp() {
        starkSigil = Sigil(image: UIImage(), iconImage: UIImage(named: "StarkIcon.jpg")!, description: "Lobo Huargo")
        lannisterSigil = Sigil(image: UIImage(), iconImage: UIImage(named: "LannisterIcon.jpg")!, description: "Leon Rampante")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", wiki: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", wiki: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        
        
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence() {
        XCTAssertNotNil(robb)
        XCTAssertNotNil(arya)
    }
    
    func testPersonFullName() {
        XCTAssertEqual(robb.fullName, "Robb Stark")
    }

    func testPersonEquality() {
        let enano = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        // Identidad
        XCTAssertEqual(robb, robb)
        // Igualdad
        XCTAssertEqual(enano, tyrion)
        //Desigualdad
        XCTAssertNotEqual(robb, arya)
    }
}
