//
//  AppDelegate.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 20/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .cyan
        window?.makeKeyAndVisible()

        // Creamos los modelos
        
        let houses = Repository.data.houses
        
        let starkSigil = Sigil(image: UIImage(named: "Stark.png")!, description: "Lobo Huargo")
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno!")
        
        let lannisterSigil = Sigil(image: UIImage(named: "Lannister.png")!, description: "Leon Rampante")
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido!")
        
        let targaryenSigil = Sigil(image: UIImage(named: "Targaryen.png")!, description: "Dragon de Tres Cabezas")
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre!")
        
        let tullySigil = Sigil(image: UIImage(named: "Tully.png")!, description: "Trucha Plateada")
        let tullyHouse = House(name: "Targaryen", sigil: tullySigil, words: "Famila, deber, honor!")
        
        // Creamos los controladores
        let starkViewController = HouseDetailViewController(model: starkHouse)
        let lannisterViewController = HouseDetailViewController(model: lannisterHouse)
        let targaryenViewController = HouseDetailViewController(model: targaryenHouse)
        let tullyViewController = HouseDetailViewController(model: tullyHouse)
        
        // Creamos el combinador para el UINavigationControler
        let starkNavigationController = UINavigationController(rootViewController: starkViewController)
        let lannisterNavigationController = UINavigationController(rootViewController: lannisterViewController)
        let targaryenNavigationController = UINavigationController(rootViewController: targaryenViewController)
        let tullyNavigationController = UINavigationController(rootViewController: tullyViewController)
        
        // Creamos el combinador para el UItabBarController
        let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = [
            starkNavigationController,
            lannisterNavigationController,
            targaryenNavigationController,
            tullyNavigationController
        ]

        // Asignamos el rootView
        window?.rootViewController = tabBarViewController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

