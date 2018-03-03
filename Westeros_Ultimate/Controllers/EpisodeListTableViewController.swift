//
//  EpisodeListTableViewController.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 28/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

protocol EpisodeListTableViewControllerDelegate {
    func episodeListTableViewController(_ viewController: EpisodeListTableViewController, didSelectEpisode: Episode)
}

class EpisodeListTableViewController: UITableViewController {
    
    // MARK: - Properties
    var model: [Episode]
    var delegate: EpisodeListTableViewControllerDelegate?
    
    // MARK: - Initilizacion
    init(model: [Episode]) {
        self.model = model
        super.init(style: .plain)
        title = "Episoders"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "EpisodeCell"
        
        // Descubrir que temporada tenemos que mostrar
        let episode = model[indexPath.row]

        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sincronizar season (model) con cell (vista)
        cell?.textLabel?.text = episode.title
        
        return cell!
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
        //let notificationCenter = NotificationCenter.default
        //notificationCenter.removeObserver(self)
    }

    @objc func episodeDidChange(notification: Notification) {
        // Extraer el userInfo de la notificacion si no esta vacia
        guard let info = notification.userInfo else { return }
        
        // Sacar la temporada de userInfo
        let episode = info[SEASON_KEY] as? Season
        
        // Actualizar el modelo
        self.model = (episode?.episodes)!
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar que episodio de ha seleccionado
        let episode = model[indexPath.row]
        
        // Avisamos al delegado
        delegate?.episodeListTableViewController(self, didSelectEpisode: episode)
        
        // Creamos un controlador de detalle de ese epidodio
        let viewController = EpisodeDetailViewController(model: episode)
        
        // Hacemos un push
        navigationController?.pushViewController(viewController, animated: true)
    }
}
