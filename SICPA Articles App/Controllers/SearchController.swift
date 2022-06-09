//
//  SearchController.swift
//  SICPA Articles App
//
//  Created by User on 10/06/2022.
//

import UIKit

class SearchController: UIViewController {

    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        searchTF.becomeFirstResponder()
    }
    
    private func configureNavigationBar() {
        self.title = "Search"
    }
    
    private func configureButton() {
        searchBtn.addTarget(self, action: #selector(searchHandler), for: .touchUpInside)
    }
    
    @objc private func searchHandler() {
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ArticlesListController") as! ArticlesListController
        vc.isSearch = true
        vc.searchText = searchTF.text ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
