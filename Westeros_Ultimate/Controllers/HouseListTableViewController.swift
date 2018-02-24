//
//  HouseListTableViewController.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 23/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

class HouseListTableViewController: UITableViewController {
    
    // MARK: - Properties
    let model: [House]

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        // Crear un controlador de detalle de esa casa
        let viewController = HouseDetailViewController(model: house)
        
        // Hacer un push
        navigationController?.pushViewController(viewController, animated: true)
    }
}
