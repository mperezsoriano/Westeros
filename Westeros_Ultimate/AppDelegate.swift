//
//  AppDelegate.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 20/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?
    var navigatorHouseController: UINavigationController?
    var navigatorSeasonController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .black
        window?.makeKeyAndVisible()

        // Creamos los modelos
        let houses = Repository.data.houses
        let season = Repository.data.seasons
        
        // Creamos los controladores
        let masterHouseListController = HouseListTableViewController(model: houses)
        let masterSeasonListcontroller = SeasonListTableViewController(model: season)
        
        // Creamos el combinador Navigation
        let masterHouseNavigationController = UINavigationController()
        let masterSeasonNavigationController = UINavigationController()
        masterHouseNavigationController.pushViewController(masterHouseListController, animated: true)
        masterSeasonNavigationController.pushViewController(masterSeasonListcontroller, animated: true)
        
        // Creamos el combinador TabBar
        let masterTabBarController = UITabBarController()
        masterTabBarController.viewControllers = [
            masterHouseNavigationController,
            masterSeasonNavigationController
        ]
 
        // Creamos los UIView Details
        let detailHouseController = HouseDetailViewController(model: houses.first!)
        let detailSeasonController = SeasonDetailViewController(model: season.first!)
        
        // Creamos el combinador Navigation para el detail
        navigatorHouseController = UINavigationController()
        navigatorHouseController?.pushViewController(detailHouseController, animated: true)
        navigatorSeasonController = UINavigationController()
        navigatorSeasonController?.pushViewController(detailSeasonController, animated: true)
       
        // Aplicamos los controladores
        if UIDevice.current.userInterfaceIdiom == .pad {
            masterHouseListController.delegate = detailHouseController
            masterSeasonListcontroller.delegate = detailSeasonController
            masterTabBarController.delegate = self
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            masterHouseListController.delegate = masterHouseListController
            masterSeasonListcontroller.delegate = masterSeasonListcontroller
        }
       
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [masterTabBarController, navigatorHouseController!]
        
        // Asignamos el rootView
        window?.rootViewController = splitViewController
    
        return true
    }

    // Controla la seleccion de los controles de la TabBarController
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {        
        if viewController.childViewControllers.first is SeasonListTableViewController {
            window?.rootViewController?.showDetailViewController(navigatorSeasonController!, sender: self)
        } else {
            window?.rootViewController?.showDetailViewController(navigatorHouseController!, sender: self)
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
