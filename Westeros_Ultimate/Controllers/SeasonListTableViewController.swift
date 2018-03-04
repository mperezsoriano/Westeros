//
//  SeasonListTableViewController.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 28/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

let SEASON_KEY = "SeasonKey"
let SEASON_DID_CHANGE_NOTIFICATION_NAME = "SeasonDidChange"

protocol SeasonListTableViewControllerDelegate {
    func seasonListTableViewController(_ viewController: SeasonListTableViewController, didSelectSeason: Season)
}

class SeasonListTableViewController: UITableViewController {
        
    // MARK: - Properties
    var model: [Season]
    var delegate: SeasonListTableViewControllerDelegate?
    
    // MARK: - Initializacion
    init(model: [Season]){
        self.model = model
        super.init(style: .plain)
        title = "Season"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "SeasonCell"

        // Descubrir que temporada tenemos que mostar
        let season = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sincronizar season (model) con cell (vista)
        cell?.textLabel?.text = season.nameOfSeason

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar que temporada se ha pulsado
        let season = model[indexPath.row]
        
        // Avisamos al delegado
        delegate?.seasonListTableViewController(self, didSelectSeason: season)
        
        // Mandamos tambien una notificacion a traves de notificaciones
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [SEASON_KEY: season])
        
        notificationCenter.post(notification)
    }
}

extension SeasonListTableViewController: SeasonListTableViewControllerDelegate {
    func seasonListTableViewController(_ viewController: SeasonListTableViewController, didSelectSeason: Season) {
        
        // Creamos un controlador de detalle de ese epidodio
        let viewController = SeasonDetailViewController(model: didSelectSeason)
        
        // Hacemos un push
        navigationController?.pushViewController(viewController, animated: true)
    }
}
