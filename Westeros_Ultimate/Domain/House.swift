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
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words) {
        self.name = name
        self.sigil = sigil
        self.words = words
        _members = Members()
    }
}

extension House {
    func add(person: Person) {
        guard person.house.name == self.name else {return}
        _members.insert(person)
    }
}

extension House {
    var count: Int {
        return _members.count
    }
}
