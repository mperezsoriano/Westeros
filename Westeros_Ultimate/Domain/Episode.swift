//
//  Episode.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 27/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

final class Episode {
    let title: String
    let releaseDate: Date
    weak var season: Season?
    let image: UIImage
    let summary: String
    
    init(title: String, releaseDate: Date, season: Season, image: UIImage, summary: String) {
        self.title = title
        self.releaseDate = releaseDate
        self.season = season
        self.image = image
        self.summary = summary
    }
}

// MARK: - CustonStringComvertible
extension Episode: CustomStringConvertible {
    var description: String {
        return ("\(releaseDate)")
    }
}

// MARK - Proxy
extension Episode {
    var proxy: String {
        return ("\(releaseDate)")
    }
    
    var proxyForComparation: String {
        return title.uppercased()
    }
}

// MARK - Hashable
extension Episode: Hashable {
    var hashValue: Int {
        return proxy.hashValue
    }
}

// MARK - Equatale
extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparation == rhs.proxyForComparation
    }
}

// MARK: - Comparable
extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}
