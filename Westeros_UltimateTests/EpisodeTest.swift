//
//  EpisodeTest.swift
//  Westeros_UltimateTests
//
//  Created by Manuel Perez Soriano on 27/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import XCTest
@testable import Westeros_Ultimate

class EpisodeTest: XCTestCase {
    
    let inputFormatter = DateFormatter()
    var firstSeason: Season!
    var episode1: Episode!
    var episode2: Episode!
    
    override func setUp() {
        super.setUp()

        inputFormatter.dateFormat = "dd-MM-yyyy"
        firstSeason =  Season(nameOfSeason: "Game of Thrones (season 1)", releaseData:  inputFormatter.date(from: "01-01-2011")!)
        episode1 = Episode(title: "Winter is Comming", releaseDate:  inputFormatter.date(from: "17-04-2011")!, season: firstSeason, image: UIImage(named: "episode11.png")!, summary: "")
        episode2 = Episode(title: "The Kingsroad", releaseDate:  inputFormatter.date(from: "24-04-2011")!, season: firstSeason, image: UIImage(named: "episode12.png")!, summary: "")
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testEpisodeExist() {
        XCTAssertNotNil(episode1)
    }
    
    func testEpisodeExistHashable() {
        XCTAssertNotNil(episode1.hashValue)
    }

    func testEpisodeComparation() {
        let episodeTest = Episode(title: "Winter is Comming", releaseDate:  inputFormatter.date(from: "17-04-2011")!, season: firstSeason, image: UIImage(named: "episode11.png")!, summary: "")
        
        XCTAssertEqual(episode1, episodeTest)
        XCTAssertNotEqual(episode1, episode2)
    }
    
    func testEpisodeEquality() {
        XCTAssertLessThan(episode1, episode2)
        XCTAssertGreaterThan(episode2, episode1)
    }
    
    func testEpisodeConvertDateToString() {
        XCTAssertEqual(episode1.description, "2011-04-16 22:00:00 +0000")
    }
}
