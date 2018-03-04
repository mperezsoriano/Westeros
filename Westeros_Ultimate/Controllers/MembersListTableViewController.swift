//
//  MembersListTableViewController.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 25/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

class MembersListTableViewController: UITableViewController {
    
    // MARK: - Properties
    var model: [Person]
    
    // MARK: - Initializacion
    init(model: [Person]){
        self.model = model
        super.init(style: .plain)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
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
        let cellId = "MembersCell"
        
        // Descubrir la casa que tenemos que mosstrar
        let person = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sincroniza house (model) con cell (vista)
        cell?.textLabel?.text = person.name
        
        return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }

    deinit {
        // Nos damos de baja en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Nos damos de baja en las notificaciones
        //let notificationCenter = NotificationCenter.default
        //notificationCenter.removeObserver(self)
    }
    
    @objc func houseDidChange(notification: Notification) {
        // Extrar el userInfo de la notificacion si no esta vacia
        guard let info = notification.userInfo else {
            return
        }
        
        // Sacar la casa de userInfo
        let house = info[HOUSE_KEY] as? House
        
        // Actualizar el modelo
        self.model = (house?.sortedMembers)!
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar que personaje se ha seleccionado
        let personaje = model[indexPath.row]
        
        // Creamos un controlador de detalle de ese personaje
        let viewController = MembersDetailViewController(model: personaje)
       
        // Hacemos un push
        navigationController?.pushViewController(viewController, animated: true)
    }
}
