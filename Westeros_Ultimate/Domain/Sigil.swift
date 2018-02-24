//
//  Sigil.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 20/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

// MARK: - Sigil
final class Sigil {
    let description: String
    let image: UIImage
    let iconImage: UIImage
    
    init(image: UIImage, iconImage: UIImage, description: String) {
        self.image = image
        self.iconImage = iconImage
        self.description = description
    }
}
