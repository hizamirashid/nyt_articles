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
    var articleViewModels: [ArticleViewModel] = []
    var searchedViewModels: [ArticleViewModel] = []
    var isSearch: Bool = false
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureNavigationBar()
        fetch()
    }
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    private func configureNavigationBar() {
        self.title = "Articles"
    }
    
    private func fetch() {
        isSearch ? fetchSearchedArticles() : fetchPopularArticles()
    }
    
    private func fetchPopularArticles() {
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
                    if let articles = articlesResult.results {
                        self?.articleViewModels = articles.map({ return ArticleViewModel(article: $0) })
                        self?.tableView.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchSearchedArticles() {
        guard let escapedURLString = ("&q=\(searchText)&fq=document_type:(\"article\")").addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        URLSession.shared.request(url: URL(string: Constants.searchArticleURL + escapedURLString) , expecting: SearchedArticles.self) { [weak self] result in
            
            switch result {
            case .success(let searchedArticlesResult):
                DispatchQueue.main.async {
                    if let response = searchedArticlesResult.response, let docs = response.docs {
                        self?.searchedViewModels = docs.map({ return ArticleViewModel(doc: $0) })
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
        return isSearch ? searchedViewModels.count : articleViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ArticleCell(style: .subtitle, reuseIdentifier: "TableViewCell")
        let articleViewModel = isSearch ? searchedViewModels[indexPath.row] : articleViewModels[indexPath.row]
        cell.articleViewModel = articleViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (searchedViewModels.isEmpty && isSearch) || (articleViewModels.isEmpty && !isSearch) {
            let spinner = UIActivityIndicatorView(style: .medium)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            
            return spinner
        } else {
            return UIView()
        }
    }
}
