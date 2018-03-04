//
//  SeasonDetailViewController.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 28/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var nameOfSeasonLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var releaseDatePicker: UIDatePicker!
    
    // MARK: - Properties
    var model: Season
    
    // MARK: - Initializacion
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
}
// MARK -  Synchronization
extension SeasonDetailViewController {
    func syncModelWithView() {
        nameOfSeasonLabel.text = model.nameOfSeason
        //releaseDateLabel.text = model.releaseDate
        releaseDatePicker.date = model.releaseDate
    }
}

// MARK: - setupUI()
extension SeasonDetailViewController {
    func setupUI() {
        let episodesButton = UIBarButtonItem(title: "Episodes", style: .plain, target: self, action: #selector(displayEpisodes))
        navigationItem.rightBarButtonItem = episodesButton
    }
}

extension SeasonDetailViewController {
    @objc func displayEpisodes() {
        // Creamos el EpisodesVC
        let episodesListTableViewController = EpisodeListTableViewController(model: model.episodes)

        // Hacemos un push
        navigationController?.pushViewController(episodesListTableViewController, animated: true)
    }
}

// MARK - Delegate
extension SeasonDetailViewController: SeasonListTableViewControllerDelegate {
    func seasonListTableViewController(_ viewController: SeasonListTableViewController, didSelectSeason: Season) {
        self.model = didSelectSeason
        setupUI()
        syncModelWithView()
    }
}
