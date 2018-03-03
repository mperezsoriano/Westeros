//
//  MembersDetailViewController.swift
//  Westeros_Ultimate
//
//  Created by Manuel Perez Soriano on 3/3/18.
//  Copyright © 2018 Manuel Perez Soriano. All rights reserved.
//

import UIKit

class MembersDetailViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var aliasLabel: UILabel!
    
    // MARK: - Properties
    let model: Person
    
    init(model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Character"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        // Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(memberDidChange), name: NSNotification.Name(rawValue: HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // nos damos de baja en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func memberDidChange(notification: Notification) {
        navigationController?.popViewController(animated: true)
    }
}

extension MembersDetailViewController {
    func syncModelWithView() {
        nameLabel.text = model.fullName
        aliasLabel.text = model.alias
        imageView.image = model.image
    }
}
