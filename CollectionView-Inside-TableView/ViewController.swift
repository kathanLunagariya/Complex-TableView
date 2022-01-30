//
//  ViewController.swift
//  CollectionView-Inside-TableView
//
//  Created by Kathan Lunagariya on 30/12/21.
//

import UIKit

struct Model {
    let sectionName:String
    let collectionItems:Int
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let modelData = [
        Model(sectionName: "first", collectionItems: 5),
        Model(sectionName: "second", collectionItems: 1),
        Model(sectionName: "third", collectionItems: 10),
        Model(sectionName: "fourth", collectionItems: 3),
        Model(sectionName: "fifth", collectionItems: 11)
    ]
    
    let table:UITableView = {
       
        let table = UITableView()
        table.separatorEffect = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(CustomTableCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return modelData[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableCell else {
            print("can't cast cell...")
            return UITableViewCell()
        }
        
        cell.collection.tag = indexPath.section
        cell.IndexPath = indexPath.section == modelData.count-1 ? 1 : 0
        cell.counts = modelData[indexPath.section].collectionItems
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == modelData.count-1 ? 200 : 110
    }
}
