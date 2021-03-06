//
//  RepositoryTest.swift
//  Westeros_UltimateTests
//
//  Created by Manuel Perez Soriano on 21/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import XCTest
@testable import Westeros_Ultimate

class RepositoryTest: XCTestCase {
    
    var houses: [House]!
    var seasons: [Season]!
    
    override func setUp() {
        super.setUp()
        houses = Repository.data.houses
        seasons = Repository.data.seasons
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
 
    func testRepositoryExistence() {
        let data = Repository.data
        XCTAssertNotNil(data)
    }
    
    func testRepositoryHousesCreation() {
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 7)
    }

    func testResitoryReturnSortedArrayOfHouses() {
        XCTAssertEqual(houses, houses.sorted())
    }

    func testRepositoryReturnsHouseByCaseIntensensitively() {
        let stark = Repository.data.house(name: "StArk")
        XCTAssertEqual(stark?.name, "Stark")
        let other = Repository.data.house(name: "Other")
        XCTAssertNil(other?.name)
    }
    
    func testRepositoryFilteringHouseBy() {
        let filtered = Repository.data.houseByFilter(filterBy: {$0.words.contains("invierno")})
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testRepositorySeasonCreation() {
        XCTAssertEqual(seasons.count, 7)
    }
    
    func testResitoryReturnSortedArrayOfSeasons() {
        XCTAssertEqual(seasons, seasons.sorted())
    }
    
    func testRepositoryFilteringSeasonBy() {
        let filtered = Repository.data.seasonByFilter(filterBy: {$0.nameOfSeason.contains("1")})
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testRepositoryReturnHouseByCaseTypeSafe() {
        let stark = Repository.data.house(named: .Stark)
        XCTAssertEqual(stark?.name, "Stark")
    }
}

