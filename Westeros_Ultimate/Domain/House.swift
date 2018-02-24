//
//  House.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 20/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import Foundation

typealias Words = String
typealias Members = Set<Person>

// mm// MARK: - House
final class House {
    let name: String
    let sigil: Sigil
    let words: Words
    let wiki: URL
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words, wiki: URL) {
        self.name = name
        self.sigil = sigil
        self.words = words
        self.wiki = wiki
        _members = Members()
    }
}

extension House {
    func add(person: Person) {
        guard person.house == self else {return}
        _members.insert(person)
    }
}

extension House {
    func add(persons: Person...) {
        for person in persons {
            add(person: person)
        }
    }
}

extension House {
    var count: Int {
        return _members.count
    }
}

// MARK: - Proxy
extension House {
    var proxy: String {
        return "\(name) \(words) \(count)"
    }
    var proxyForComparation: String {
        return name.uppercased()
    }
}

// MARK: - Hashable
extension House: Hashable {
    var hashValue: Int {
        return proxy.hashValue
    }
}

// MARK: - Equatable
extension House: Equatable {
    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

// MARK: - Comparable
extension House: Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparation < rhs.proxyForComparation
    }
}
