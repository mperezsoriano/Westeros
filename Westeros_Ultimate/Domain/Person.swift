//
//  Character.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 20/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import Foundation

// MARK: - Person
final class Person {
    let name: String
    let alias: String
    let house: House
    
    init(name: String, alias: String, house: House) {
        self.name = name
        self.alias = alias
        self.house = house
    }
    
    convenience init(name: String, house: House) {
        self.init(name: name, alias: "", house: house)
    }
}

extension Person {
    var fullName: String {
        return ("\(name) \(house.name)")
    }
}

// MARK: - Proxy
extension Person {
    var proxyForEquality: String {
        return "\(name) \(alias) \(house.name)"
    }
    
    var proxyForComparison: String {
        return "\(name) \(house.name)"
    }
}

// MARK: - Hashable
extension Person: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Equatable
extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Comparable
extension Person: Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForEquality < rhs.proxyForEquality
    }
}
