//
//  Repository.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 21/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

let starkSigil = Sigil(image: UIImage(named: "Stark.png")!, description: "Lobo Huargo")
let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno!")

import UIKit

final class Repository {
    static let data:DataFactory = DataFactory()
}

