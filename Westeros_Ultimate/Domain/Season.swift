//
//  Season.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 26/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>

final class Season {
    let nameOfSeason: String
    var releaseDate: Date
    private var _episodes: Episodes
    private var _numEpisodes: Int
    
    init(nameOfSeason: String, releaseData: Date) {
        self.nameOfSeason = nameOfSeason
        self.releaseDate = releaseData
        _episodes = Episodes()
        _numEpisodes = _episodes.count
    }
}

// MARK: - Count Episodes
extension Season {
    var count: Int {
        return _numEpisodes
    }
}

extension Season {
    var episodes: [Episode] {
        let arrayEpisodes = Array(_episodes)
        return arrayEpisodes
    }
}

// MARK: - Add
extension Season {
    func add(episode: Episode) {
        _episodes.insert(episode)
        _numEpisodes = _episodes.count
    }
    
    func add(episodes: Episode...) {
        for episode in episodes {
            add(episode: episode)
        }
    }
}

// MARK - CustomStringConvertible
extension Season: CustomStringConvertible {
    var description: String {
        return ("\(releaseDate)")
    }
}

// MARK: - Proxy
extension Season {
    var proxy: String {
        return ("\(releaseDate)")
    }
    
    var proxyForComparation: String {
        return nameOfSeason.uppercased()
    }
}

// MARK: - Hashable
extension Season: Hashable {
    var hashValue: Int {
        return proxy.hashValue
    }
}

// MARK: - Equatable
extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparation == rhs.proxyForComparation
    }
}

// MARK: - Comparable
extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}
