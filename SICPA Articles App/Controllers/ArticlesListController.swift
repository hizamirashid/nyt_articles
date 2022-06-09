//
//  ArticlesListController.swift
//  SICPA Articles App
//
//  Created by User on 10/06/2022.
//

import UIKit

class ArticlesListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var popularType: PopularType = .mostViewed
    var url: URL?
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureNavigationBar()
        fetch()
    }
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    private func configureNavigationBar() {
        self.title = "Articles"
    }
    
    private func fetch() {
        
        switch popularType {
        case .mostViewed:
            url = Constants.mostViewedURL
        case .mostShared:
            url = Constants.mostSharedURL
        case .mostEmailed:
            url = Constants.mostEmailed
        }
        URLSession.shared.request(url: url, expecting: ArticlesResult.self) { [weak self] result in
            
            switch result {
            case .success(let articlesResult):
                DispatchQueue.main.async {
                    if let articles = articlesResult.articles {
                        self?.articles = articles
                        self?.tableView.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension ArticlesListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TableViewCell")
        cell.textLabel?.text = articles[indexPath.row].title
        cell.detailTextLabel?.text = articles[indexPath.row].published_date
        return cell
    }
}
