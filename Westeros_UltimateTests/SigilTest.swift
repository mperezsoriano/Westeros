//
//  SigilTest.swift
//  Westeros_UltimateTests
//
//  Created by Manuel Perez Soriano on 20/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import XCTest
@testable import Westeros_Ultimate

class SigilTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        XCTAssertNotNil(starkSigil)
    }
}
