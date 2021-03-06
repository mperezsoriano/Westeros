//
//  HouseListTableViewController.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 23/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

let HOUSE_KEY = "HouseKey"
let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"
let LAST_HOUSE = "LastHouse"

protocol HouseListTableViewControllerDelegate {
    // should, will, did
    func houseListTableViewController(_ viewController: HouseListTableViewController, didSelectHouse: House)
}

class HouseListTableViewController: UITableViewController {
    
    // MARK: - Properties
    let model: [House]
    var delegate: HouseListTableViewControllerDelegate?

    // MARK: - Initialization
    init(model: [House]){
        self.model = model
        super.init(style: .plain)
        title = "Westeros"
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
        let cellId = "HouseCell"
        
        // Descubrir la casa que tenemos que mosstrar
        let house = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sincroniza house (model) con cell (vista)
        cell?.imageView?.image = house.sigil.iconImage
        cell?.textLabel?.text = house.name

        return cell!
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Averiguar que casa han pulsado
        let house = model[indexPath.row]
        
        // Avisamos al delegado
        delegate?.houseListTableViewController(self, didSelectHouse: house)
        
        // Mandamos tambien la informacion a traves de notificaciones
        let notificationCenter = NotificationCenter.default
        let notificacion = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY: house])
        
        notificationCenter.post(notificacion)
        
        // Guardamos las coordenadas (secction, row) de la ultima casa seleccionada.
        //saveLastSelectedHouse(at: indexPath.row)

        // Crear un controlador de detalle de esa casa
        //let viewController = HouseDetailViewController(model: house)
        
        // Hacer un push
        //navigationController?.pushViewController(viewController, animated: true)
        
        // Guardar las coordenadas (section, row) de la ultima casa seleccionada
        //saveLastSelectedHouse(at: indexPath.row)
    }
}

extension HouseListTableViewController {
    func saveLastSelectedHouse(at row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: LAST_HOUSE)
        defaults.synchronize()
    }
    
    func lastSelectedHouse() -> House {
        // Extraer la row del User Default
        let row = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        
        // Averiguar la casa de ese row
        let house =  model[row]
        
        // Devolverla
        return house
    }
}

extension HouseListTableViewController: HouseListTableViewControllerDelegate {
    func houseListTableViewController(_ viewController: HouseListTableViewController, didSelectHouse: House){
       
        // Creamos un controlador de detalle de ese casa
        let viewController = HouseDetailViewController(model: didSelectHouse)
        
        // Hacemos un push
        navigationController?.pushViewController(viewController, animated: true)
    }
}

