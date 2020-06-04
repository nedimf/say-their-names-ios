//
//  PersonController.swift
//  Say Their Names
//
//  Created by Ahmad Karkouti on 30/05/2020.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import UIKit

enum PersonCellType: String {
    case photo
    case info
    
    var identifier: String {
        switch self {
        case .photo: return "PersonCellType_Photo"
        case .info: return "PersonCellType_Info"
        }
    }
    
    var accessibilityIdentifier: String {
        switch self {
        case .photo: return "PersonCellType_Photo"
        case .info: return "PersonCellType_Info"
        }
    }
    
    func register(to tableView: UITableView) {
        switch self {
        case .photo:
            PersonPhotoTableViewCell.register(to: tableView, identifier: identifier)
        default:
            break
        }
    }
}


class PersonController: BaseViewController {

//    private let personView = PersonView()

    var tableView: UITableView = UITableView(frame: .zero)
    
    var sareArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "personView"

    }
    
    override func loadView() {
        super.loadView()
        sareArea = view.layoutMarginsGuide
        setupNavigationBarItems()
        setupTableView()
    }
    
    private func setupNavigationBarItems() {
        let dismissButton = UIButton(type: .system)
        dismissButton.setImage(UIImage(named: "Close Icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        dismissButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: dismissButton)
        
        let shareButton = UIButton(type: .system)
        shareButton.setImage(UIImage(named: "share_white")?.withRenderingMode(.alwaysOriginal), for: .normal)
        shareButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareButton)
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: sareArea.topAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        
        PersonCellType.photo.register(to: tableView)
    }
    
//    @IBAction func didPressCloseButton() {
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    @IBAction func didPressReadButton(_ sender: Any) {
//        let personDetailsController = PersonDetailsController(service: self.service)
//        personDetailsController.isModalInPresentation = true
//        navigationController?.pushViewController(personDetailsController, animated: true)
//      }
    
}


extension PersonController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photoCell = tableView.dequeueReusableCell(withIdentifier: PersonCellType.photo.identifier, for: indexPath)
        return photoCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 520
    }
}
