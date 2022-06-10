//
//  SICPA_Articles_AppTests.swift
//  SICPA Articles AppTests
//
//  Created by User on 10/06/2022.
//

import XCTest
@testable import SICPA_Articles_App

class SICPA_Articles_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testArticleViewModel() {
        let article = Article(published_date: "10 Jun 2022", title: "Star Wars: Return of the Jedi")
        let articleViewModel = ArticleViewModel(article: article)
        
        XCTAssertEqual(article.title, articleViewModel.title)
        XCTAssertEqual(article.published_date, articleViewModel.published_date)
    }
    
    func testSearchedViewModel() {
        let article = Docs(abstract: "Star Wars: Return of the Jedi", pub_date: "10 Jun 2022")
        let articleViewModel = ArticleViewModel(doc: article)
        
        XCTAssertEqual(article.abstract, articleViewModel.title)
        XCTAssertEqual(article.pub_date, articleViewModel.published_date)
    }

}
