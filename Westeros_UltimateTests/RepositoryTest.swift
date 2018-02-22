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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        let houses = Repository.data.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 7)
    }
}
