//
//  DataFactory.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 22/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

protocol DataFactoy {
    var houses: [House] {get}
}
final class DataFactory: DataFactoy{
    var houses: [House] {
        // Houses creation
        let starkSigil = Sigil(image: UIImage(named: "Stark.png")!, description: "Lobo Huargo")
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno!")
        
        let lannisterSigil = Sigil(image: UIImage(named: "Lannister.png")!, description: "Leon Rampante")
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido!")
        
        let targaryenSigil = Sigil(image: UIImage(named: "Targaryen.png")!, description: "Dragon de Tres Cabezas")
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre!")
        
        let tullySigil = Sigil(image: UIImage(named: "Tully.png")!, description: "Trucha Plateada")
        let tullyHouse = House(name: "Targaryen", sigil: tullySigil, words: "Famila, deber, honor!")
        
        let arrynSigil = Sigil(image: UIImage(named: "Arryn.png")!, description: "Halcon y Creciente Plata")
        let arrynHouse = House(name: "Targaryen", sigil: arrynSigil, words: "Tan alto como el honor!")
        
        let baratheonSigil = Sigil(image: UIImage(named: "Baratheon.png")!, description: "Ciervo Rampante")
        let baratheonHouse = House(name: "Targaryen", sigil: baratheonSigil, words: "Nuesta es la furia!")
        
        let greyjoySigil = Sigil(image: UIImage(named: "Greyjoy.png")!, description: "Kraken Dorado")
        let greyjoyHouse = House(name: "Targaryen", sigil: greyjoySigil, words: "Nosotros no sembramos!")
        
        // Character creation
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        
        // Add character to houses
        starkHouse.add(person: robb)
        starkHouse.add(person: arya)
        lannisterHouse.add(person: tyrion)
        
        return [starkHouse, lannisterHouse, targaryenHouse, tullyHouse, arrynHouse, baratheonHouse, greyjoyHouse]
    }
}
