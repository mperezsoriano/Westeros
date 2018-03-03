//
//  DataFactory.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 22/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

protocol DataFactoy {
    var seasons: [Season] {get}
    var houses: [House] {get}
    func seasonByFilter(filterBy:(Season) -> Bool) -> [Season]
    func house(name: String) -> House?
    func houseByFilter(filterBy:(House) -> Bool) -> [House]
    func house(named: HouseName) -> House?
}

enum HouseName {
    case Stark, Lannister, Targaryen, Tully, Arryn, Baratheon, Greyjoy
    
    func toString() -> String {
        switch self {
        case .Stark:
            return "Stark"
        case .Lannister:
            return "Lannister"
        case .Targaryen:
            return "Targaryen"
        case .Tully:
            return "Tully"
        case .Arryn:
            return "Arryn"
        case .Baratheon:
            return "Baratheon"
        case .Greyjoy:
            return "Greyjoy"
        }
    }
}

final class DataFactory: DataFactoy{
    
    var seasons: [Season] {
        // Season creation
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd-MM-yyyy"
        let firstSeason =  Season(nameOfSeason: "Game of Thrones (season 1)", releaseData: inputFormatter.date(from: "01-01-2012")!)
        let secondSeason =  Season(nameOfSeason: "Game of Thrones (season 2)", releaseData: inputFormatter.date(from: "01-01-2012")!)
        let thirdSeason =  Season(nameOfSeason: "Game of Thrones (season 3)", releaseData: inputFormatter.date(from: "01-01-2013")!)
        let fourthSeason =  Season(nameOfSeason: "Game of Thrones (season 4)", releaseData: inputFormatter.date(from: "01-01-2014")!)
        let fifthSeason =  Season(nameOfSeason: "Game of Thrones (season 5)", releaseData: inputFormatter.date(from: "01-01-2015")!)
        let sixthSeason =  Season(nameOfSeason: "Game of Thrones (season 6)", releaseData: inputFormatter.date(from: "01-01-2016")!)
        let seventhSeason =  Season(nameOfSeason: "Game of Thrones (season 7)", releaseData: inputFormatter.date(from: "01-01-2017")!)
        
        // Episodie creation
        let episodie11 = Episode(title: "Winter is Comming", releaseDate:  inputFormatter.date(from: "17-04-2011")!, season: firstSeason, image: UIImage(named: "episode11.jpg")!, summary: "As the first episode of the series, it introduces the setting and the main characters of the show. The episode centers on the Stark family, and how its lord, Eddard Stark, gets involved in the court politics after the king chooses Eddard to replace his recently deceased chief administrator. The episode received largely positive reviews, and was seen initially by 2.2 million viewers. A week before the episode first aired, HBO made the first 15 minutes available as an Internet preview.")
        let episodie12 = Episode(title: "The Kingsroad", releaseDate:  inputFormatter.date(from: "24-04-2011")!, season: firstSeason, image: UIImage(named: "episode12.jpg")!, summary: "Nearly all the action of the episode happens during travel: Eddard Stark and his daughters accompany the king's entourage to King's Landing to occupy the post of Hand of the King, Tyrion Lannister joins Jon in his travel to the Wall, and the newly wed Daenerys goes with her husband's khalasar to the city of Vaes Dothrak. Meanwhile, in Winterfell a grieving Catelyn Stark watches over her unconscious son Bran.")
        let episodie21 = Episode(title: "The North Remembers", releaseDate:  inputFormatter.date(from: "01-04-2012")!, season: secondSeason, image: UIImage(named: "episode21.jpg")!, summary: "With a war on the horizon, the Seven Kingdoms are witnessing an ever-growing clash of kings. The boy king Joffrey Baratheon (Jack Gleeson) sits on the Iron Throne guided by cruelty and deceit, while his honorable counterpart Robb Stark (Richard Madden) of the North heads south to avenge his father's death. Meanwhile, the late king Robert Baratheon's estranged brother Stannis (Stephen Dillane) emerges as yet another claimant to the throne. A frantic search for King Robert's bastard sons ensues, while the Queen sets to find the missing Arya Stark (Maisie Williams) in order to retrieve her lover and brother Jaime, now a captive to the Starks.")
        let episodie22 = Episode(title: "The Night Lands", releaseDate:  inputFormatter.date(from: "08-04-2012")!, season: secondSeason, image: UIImage(named: "episode22.jpg")!, summary: "The plot continues with some of the storylines from the season premiere: the Night's Watch caravan heading to the Wall is interrupted by a pair of City Watch guards looking for Gendry, the Small Council receives the terms proposed by King in the North Robb Stark, Daenerys waits in the desert for the return of the three riders she had sent out, and Theon Greyjoy returns to his homeland of the Iron Islands.")
        let episodie31 = Episode(title: "Valar Dohaeris", releaseDate:  inputFormatter.date(from: "31-03-2013")!, season: thirdSeason, image: UIImage(named: "episode31.jpg")!, summary: "The premiere continues where the second season left off, with the Lannisters consolidating their power at King's Landing in the aftermath of the Battle of the Blackwater. Meanwhile, Jon Snow meets the King beyond the Wall, and Daenerys leaves Qarth for Slaver's Bay. The episode's title translates to all men must serve in the High Valyrian language in George R. R. Martin's A Song of Ice and Fire novels, which the series adapts. The title mirrors that of season 2's finale, Valar Morghulis – all men must die.")
        let episodie32 = Episode(title: "Dark Wings, Dark Words", releaseDate:  inputFormatter.date(from: "07-04-2013")!, season: thirdSeason, image: UIImage(named: "episode32.jpg")!, summary: "The title is an in-universe old saying about messenger-ravens, referring to the fact that such urgently delivered messages are often bad news. In the episode, Robb Stark receives news of the death of Hoster Tully as well as the sack of Winterfell and the disappearances of Bran and Rickon.")
        let episodie41 = Episode(title: "Two Swords", releaseDate:  inputFormatter.date(from: "06-04-2014")!, season: fourthSeason, image: UIImage(named: "episode41.jpg")!, summary: "The title of the episode refers to the two swords Tywin Lannister forges from Ice, Ned Stark's large Valyrian steel sword, in the opening sequence.")
        let episodie42 = Episode(title: "The Lion and the Rose", releaseDate:  inputFormatter.date(from: "12-04-2014")!, season: fourthSeason, image: UIImage(named: "episode42.jpg")!, summary: "The episode focuses principally on the long-awaited royal wedding between Joffrey Baratheon and Margaery Tyrell. Other storylines include House Bolton's quest to retake the North, and Bran's continued journey north of The Wall. The title of the episode refers to the sigils of the wedding couple's respective houses – a lion for Joffrey Baratheon, who is in truth a Lannister, and a rose for Margaery Tyrell.")
        let episodie51 = Episode(title: "The Wars to Come", releaseDate:  inputFormatter.date(from: "12-04-2015")!, season: fifthSeason, image: UIImage(named: "episode51.jpg")!, summary: "The episode was written by series co-creators David Benioff and D. B. Weiss, and directed by Michael Slovis, his directorial debut for the series.[1] It aired on April 12, 2015. Prior to airing, this episode along with the remaining first four episodes of the season were leaked online.[2]. This episode marks the final appearance of Charles Dance and Ciarán Hinds.")
        let episodie52 = Episode(title: "The House of Black and White", releaseDate:  inputFormatter.date(from: "19-04-2015")!, season: fifthSeason, image: UIImage(named: "episode52.jpg")!, summary: "Cersei and Jaime receive a message from Dorne: a small viper statue with a necklace in its fangs. Cersei tells Jaime that the necklace belongs to their daughter, Myrcella, who was sent to Dorne by Tyrion. Jaime tells Cersei that he will travel to Dorne and bring Myrcella back. He travels to meet with Bronn, who has gone to Castle Stokeworth with Lollys, his fiancée. Jaime gives Bronn a letter telling him that he will not be wed to Lollys. When Bronn reminds him of the deal he had with Cersei, Jaime tells him that, should he agree to help rescue Myrcella, he will instead be wed to a woman of higher standing, with a larger castle.")
        let episodie61 = Episode(title: "The Red Woman", releaseDate:  inputFormatter.date(from: "24-04-2016")!, season: sixthSeason, image: UIImage(named: "episode61.jpg")!, summary: "The body of Jon Snow is discovered by Ser Davos Seaworth and loyal members of the Night's Watch protect his lifeless body; Melisandre has begun to lose her faith in the Lord of Light; Sansa Stark and Theon Greyjoy flee Winterfell, Ellaria Sand and the Sand Snakes seize control of Dorne; Jaime Lannister returns to King's Landing with the body of his dead daughter; and Daenerys Targaryen is taken prisoner by the khalasar of Khal Moro.")
        let episodie62 = Episode(title: "Home", releaseDate:  inputFormatter.date(from: "01-05-2016")!, season: sixthSeason, image: UIImage(named: "episode62.jpg")!, summary: "The Wildlings arrive at Castle Black and force Alliser Thorne and his allies to surrender, allowing Melisandre to resurrect Jon Snow. Ramsay Bolton seizes Winterfell and the North for himself; Tyrion Lannister unchains the dragons being held in the catacombs of Meereen; Arya Stark proceeds to the next step in her training; and Bran Stark sees the past.")
        let episodie71 = Episode(title: "Dragonstone", releaseDate:  inputFormatter.date(from: "16-07-2017")!, season: seventhSeason, image: UIImage(named: "episode71.jpg")!, summary: "The episode's main plot focuses on Daenerys Targaryen's long-awaited homecoming to Dragonstone with her vast forces, and Cersei and Jaime Lannister treating with Euron Greyjoy for an alliance after the demise of House Frey.")
        let episodie72 = Episode(title: "Stormborn", releaseDate:  inputFormatter.date(from: "23-07-2017")!, season: seventhSeason, image: UIImage(named: "episode72.jpg")!, summary: "The episode's main plot focuses on Daenerys planning her conquest of Westeros; at the behest of Melisandre, she orders Tyrion to summon Jon Snow, who agrees to meet with her despite the objections of Sansa and several other supporters. In King's Landing, Cersei Lannister warns her bannermen about Daenerys's impending invasion. Meanwhile, in the Narrow Sea, the Greyjoys and Sand Snakes are attacked by Euron Greyjoy's Iron Fleet, with Yara Greyjoy and Ellaria Sand being taken as hostages.")
        
        // Add episodes to seasons
        firstSeason.add(episodes: episodie11, episodie12)
        secondSeason.add(episodes: episodie21, episodie22)
        thirdSeason.add(episodes: episodie31, episodie32)
        fourthSeason.add(episodes: episodie41, episodie42)
        fifthSeason.add(episodes: episodie51, episodie52)
        sixthSeason.add(episodes: episodie61, episodie62)
        seventhSeason.add(episodes: episodie71, episodie72)
        
        return [firstSeason, secondSeason, thirdSeason, fourthSeason, fifthSeason, sixthSeason, seventhSeason].sorted()
    }
    
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
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse, image: UIImage(named: "person_robb.jpg")!)
        let arya = Person(name: "Arya", house: starkHouse, image: UIImage(named: "person_arya.jpg")!)
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse, image: UIImage(named: "person_tyrion.jpg")!)
        let cersei = Person(name: "Cersei", house: lannisterHouse, image: UIImage(named: "person_cersei.jpg")!)
        let jaime = Person(name: "Jaime", alias: "el Matarreyes", house: lannisterHouse, image: UIImage(named: "person_jaime.jpg")!)
        let daenerys = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse, image: UIImage(named: "person_daenerys.jpg")!)
        
        let _ = [robb, arya, tyrion, cersei, jaime, daenerys]
        
        // Add character to houses
        //starkHouse.add(person: robb)
        //starkHouse.add(person: arya)
        //lannisterHouse.add(person: tyrion)
        //lannisterHouse.add(person: cersei)
        //targaryenHouse.add(person: jaime)
        //targaryenHouse.add(person: daenerys)
        
        return [starkHouse, lannisterHouse, targaryenHouse, tullyHouse, arrynHouse, baratheonHouse, greyjoyHouse].sorted()
    }
    
    func seasonByFilter(filterBy: (Season) -> Bool) -> [Season] {
        return seasons.filter(filterBy)
    }
    
    func house(name: String) -> House? {
        return houses.filter{ $0.name.uppercased() == name.uppercased() }.first
    }
    
    func houseByFilter(filterBy: (House) -> Bool) -> [House] {
        return houses.filter(filterBy)
    }
    
    func house(named: HouseName) -> House? {
        return houses.filter{$0.name == named.toString()  }.first
    }
}
