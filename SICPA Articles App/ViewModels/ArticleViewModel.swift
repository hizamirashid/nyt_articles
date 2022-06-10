//
//  ArticleViewModel.swift
//  SICPA Articles App
//
//  Created by User on 10/06/2022.
//

import Foundation

struct ArticleViewModel {
    
    let title: String
    let published_date: String
    
    // Dependency Injection
    init(article: Article) {
        self.title = article.title ?? ""
        self.published_date = article.published_date ?? ""
    }
    
    init(doc: Docs) {
        self.title = doc.abstract ?? ""
        self.published_date = doc.pub_date ?? ""
    }
}
