//
//  HouseTest.swift
//  Westeros_UltimateTests
//
//  Created by Manuel Perez Soriano on 20/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import XCTest
@testable import Westeros_Ultimate

class HouseTest: XCTestCase {
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
    override func setUp() {
        starkSigil = Sigil(image: UIImage(),  iconImage: UIImage(named: "StarkIcon.jpg")!, description: "Lobo Huargo")
        lannisterSigil = Sigil(image: UIImage(),  iconImage: UIImage(named: "LannisterIcon.jpg")!, description: "Leon Rampante")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", wiki: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", wiki: URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse, image: UIImage(named: "person_robb.jpg")!)
        arya = Person(name: "Arya", house: starkHouse, image: UIImage(named: "person_arya.jpg")!)
        tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse, image: UIImage(named: "person_tyrion.jpg")!)
        
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHouseExistence() {
        XCTAssertNotNil(starkHouse)
    }
    
    func testHouseAddPersons() {
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
        let cersei = Person(name: "Cersei", house: lannisterHouse, image: UIImage(named: "person_cersei.jpg")!)
        let jaime = Person(name: "Jaime", alias: "el Matarreyes", house: lannisterHouse, image: UIImage(named: "person_jaime.jpg")!)
        starkHouse.add(persons: cersei, jaime)
    }
    
    func testHouseEquality() {
        let starkHouseCopy = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", wiki: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        // Igualdad
        XCTAssertEqual(starkHouseCopy, starkHouse)
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHouseExistHashable() {
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison() {
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
    func testHouseReturnsSortedArrayOfMembers() {
        starkHouse.add(persons: robb, arya)
        XCTAssertEqual(starkHouse.sortedMembers, [arya, robb])
    }
    
    func testHouse() {
        
    }
}
