//
//  LandingController.swift
//  SICPA Articles App
//
//  Created by User on 09/06/2022.
//

import UIKit

class LandingController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let popularType: [PopularType] = [
        .mostViewed,
        .mostShared,
        .mostEmailed
    ]
    var selectedType: PopularType = .mostViewed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureTableView()
    }
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    private func configureNavigationBar() {
        self.title = "NYT"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchHandler))
    }
    
    @objc private func searchHandler() {
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchController") as! SearchController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LandingController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = popularType[indexPath.row].rawValue
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ArticlesListController") as! ArticlesListController
        vc.popularType = popularType[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
