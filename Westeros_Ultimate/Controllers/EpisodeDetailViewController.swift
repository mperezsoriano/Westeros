//
//  EpisodeDetailViewController.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 28/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var seaonLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var summaryTextField: UITextView!
    
    
    // MARK: - Properties
    var model: Episode
    
    // MARK: - Initializacion
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episode"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(episodeDidChange), name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Nos damos de baja en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func episodeDidChange(notification: Notification) {
        navigationController?.popViewController(animated: true)
    }
}

extension EpisodeDetailViewController {
    func syncModelWithView() {
        seaonLabel.text = model.season?.nameOfSeason
        titleLabel.text = model.title
        imageView.image = model.image
        summaryTextField.text = model.summary
    }
}

extension EpisodeDetailViewController: EpisodeListTableViewControllerDelegate {
    func episodeListTableViewController(_ viewController: EpisodeListTableViewController, didSelectEpisode: Episode) {
        self.model = didSelectEpisode
        syncModelWithView()
    }
}
