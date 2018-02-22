//
//  HouseDetailViewController.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 21/2/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var houseWordsLabel: UILabel!
    
    // MARK: - Properties
    let model: House
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
}

extension HouseDetailViewController {
    func syncModelWithView() {
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        houseWordsLabel.text = model.words
    }
}
