//
//  SeasonTest.swift
//  Westeros_UltimateTests
//
//  Created by Manuel Perez Soriano on 26/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import XCTest
@testable import Westeros_Ultimate

class SeasonTest: XCTestCase {
    
    let inputFormatter = DateFormatter()
    var firstSeason: Season!
    var secondSeason: Season!
    var episode1: Episode!
    var episode2: Episode!
    
    override func setUp() {
        super.setUp()
        
        inputFormatter.dateFormat = "dd-MM-yyyy"
        firstSeason =  Season(nameOfSeason: "Game of Thrones (season 1)", releaseData: inputFormatter.date(from: "01-01-2011")!)
        secondSeason =  Season(nameOfSeason: "Game of Thrones (season 2)", releaseData: inputFormatter.date(from: "01-01-2012")!)
        episode1 = Episode(title: "Winter is Comming", releaseDate:  inputFormatter.date(from: "17-04-2011")!, season: firstSeason, image: UIImage(named: "episode11.png")!, summary: "")
        episode2 = Episode(title: "The Kingsroad", releaseDate:  inputFormatter.date(from: "24-04-2011")!, season: firstSeason, image: UIImage(named: "episode12.png")!, summary: "")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil(firstSeason)
    }
    
    func testSeasonReturnNumberOfEpisodesInStart() {
        XCTAssertEqual(firstSeason.count, 0)
    }
    
    func testSeasonAddEpisode() {
        firstSeason.add (episode: episode1)
        XCTAssertEqual(firstSeason.count, 1)
        
        firstSeason.add (episode: episode1)
        XCTAssertEqual(firstSeason.count, 1)
        
        firstSeason.add (episode: episode2)
        XCTAssertEqual(firstSeason.count, 2)
        
    }
    
    func testSeasonAddSomeEpisodes() {
        firstSeason.add (episodes: episode1, episode2)
        XCTAssertEqual(firstSeason.count, 2)
    }
    
    func testSeasonExistHashable() {
        XCTAssertNotNil(firstSeason.hashValue)
    }
    
    func testSeasonComparation() {
        let  firstSeasonTest =  Season(nameOfSeason: "Game of Thrones (season 1)", releaseData: inputFormatter.date(from: "01-01-2011")!)
        
        XCTAssertEqual(firstSeason, firstSeasonTest)
        XCTAssertNotEqual(firstSeason, secondSeason)
    }
    
    func testSeasonEquality() {
        XCTAssertLessThan(firstSeason, secondSeason)
        XCTAssertGreaterThan(secondSeason, firstSeason)
    }
    
    func testSeasonConvertDateToString() {
        XCTAssertEqual(firstSeason.description, "2010-12-31 23:00:00 +0000")
    }
    
    func testSeasonListEpisodes() {
        firstSeason.add(episodes: episode1, episode2)
        XCTAssertEqual(firstSeason.episodes.count, 2)
    }
}
