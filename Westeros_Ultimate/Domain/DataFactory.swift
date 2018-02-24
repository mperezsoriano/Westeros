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
    func house(name: String) -> House?
    func houseByFilter(filterBy:(House) -> Bool)-> [House]
}

final class DataFactory: DataFactoy{

    var houses: [House] {
        // Houses creation
        let starkSigil = Sigil(image: UIImage(named: "Stark.png")!, iconImage: UIImage(named: "StarkIcon.jpg")!, description: "Lobo Huargo")
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno!", wiki: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!)
        
        let lannisterSigil = Sigil(image: UIImage(named: "Lannister.png")!, iconImage: UIImage(named: "LannisterIcon.jpg")!, description: "Leon Rampante")
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido!", wiki: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        let targaryenSigil = Sigil(image: UIImage(named: "Targaryen.png")!, iconImage: UIImage(named: "TargaryenIcon.jpg")!, description: "Dragon de Tres Cabezas")
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre!", wiki: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let tullySigil = Sigil(image: UIImage(named: "Tully.png")!, iconImage: UIImage(named: "TullyIcon.jpg")!, description: "Trucha Plateada")
        let tullyHouse = House(name: "Tully", sigil: tullySigil, words: "Famila, deber, honor!", wiki: URL(string: "https://awoiaf.westeros.org/index.php/House_Tully")!)
        
        let arrynSigil = Sigil(image: UIImage(named: "Arryn.png")!, iconImage: UIImage(named: "ArrynIcon.jpg")!, description: "Halcon y Creciente Plata")
        let arrynHouse = House(name: "Arryn", sigil: arrynSigil, words: "Tan alto como el honor!", wiki: URL(string: "https://awoiaf.westeros.org/index.php/House_Arryn")!)
        
        let baratheonSigil = Sigil(image: UIImage(named: "Baratheon.png")!, iconImage: UIImage(named: "BaratheonIcon.jpg")!, description: "Ciervo Rampante")
        let baratheonHouse = House(name: "Baratheon", sigil: baratheonSigil, words: "Nuesta es la furia!", wiki: URL(string: "https://awoiaf.westeros.org/index.php/House_Baratheon")!)
        
        let greyjoySigil = Sigil(image: UIImage(named: "Greyjoy.png")!, iconImage: UIImage(named: "GreyjoyIcon.jpg")!, description: "Kraken Dorado")
        let greyjoyHouse = House(name: "Greyjoy", sigil: greyjoySigil, words: "Nosotros no sembramos!", wiki: URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!)
        
        // Character creation
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "el Matarreyes", house: lannisterHouse)
        let daenerys = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        
        // Add character to houses
        starkHouse.add(person: robb)
        starkHouse.add(person: arya)
        lannisterHouse.add(person: tyrion)
        lannisterHouse.add(person: cersei)
        targaryenHouse.add(person: jaime)
        targaryenHouse.add(person: daenerys)
        
        return [starkHouse, lannisterHouse, targaryenHouse, tullyHouse, arrynHouse, baratheonHouse, greyjoyHouse].sorted()
    }
    
    func house(name: String) -> House? {
        return houses.filter{ $0.name.uppercased() == name.uppercased() }.first
    }
    
    func houseByFilter(filterBy: (House) -> Bool) -> [House] {
        return houses.filter(filterBy)
    }
}
