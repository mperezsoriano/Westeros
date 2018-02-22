//
//  UIViewController+Additions.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 21/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

extension UITabBarController {
    func compose(house1:House, house2:House, house3:House) -> [UINavigationController]{
        let ViewController1 = HouseDetailViewController(model: house1)
        let ViewController2 = HouseDetailViewController(model: house2)
        let ViewController3 = HouseDetailViewController(model: house3)
        
        let NavigationController1 = UINavigationController(rootViewController: ViewController1)
        let NavigationController2 = UINavigationController(rootViewController: ViewController2)
        let NavigationController3 = UINavigationController(rootViewController: ViewController3)
   
        
        return [
            NavigationController1,
            NavigationController2,
            NavigationController3,
        ]
    }
}
