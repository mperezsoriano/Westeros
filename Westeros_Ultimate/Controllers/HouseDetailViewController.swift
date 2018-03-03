//
//  HouseDetailViewController.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 21/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController, UITabBarControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var houseWordsLabel: UILabel!
    
    // MARK: - Properties
    var model: House
    
    // MARK: - Initialization
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
}

// MARK: - Synchronization
extension HouseDetailViewController {
    func syncModelWithView() {
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        houseWordsLabel.text = model.words
    }
}

// MARK: - setupUI()
extension HouseDetailViewController {
    func setupUI() {
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain, target: self, action: #selector(displayWiki))
        let membersButton  = UIBarButtonItem(title: "Members", style: .plain, target: self, action: #selector(displayMembers))
        if (model.sortedMembers.count == 0) {
            membersButton.isEnabled = false
        }
        navigationItem.rightBarButtonItems = [membersButton, wikiButton]
    }
}

extension HouseDetailViewController {
    @objc func displayWiki() {
        // Creamos el WikiVC
        let wikiViewController = WikiViewController(model: model)
        
        // Hacemos un push
        navigationController?.pushViewController(wikiViewController, animated: true)
    }

    @objc func displayMembers() {
        // Creamos el MembersVC
        let membersListViewController = MembersListTableViewController(model: model.sortedMembers)
    
       // Hacemos un push
        navigationController?.pushViewController(membersListViewController, animated: true)
    }
}

extension HouseDetailViewController: HouseListTableViewControllerDelegate {
    func houseListTableViewController(_ viewController: HouseListTableViewController, didSelectHouse: House) {
        self.model = didSelectHouse
        setupUI()
        syncModelWithView()
    }
}

