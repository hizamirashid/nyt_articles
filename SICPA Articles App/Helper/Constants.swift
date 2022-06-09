//
//  Constants.swift
//  SICPA Articles App
//
//  Created by User on 09/06/2022.
//

import Foundation

struct Constants {
    static let apiKey = "PmDhKbt8LiCEM4qMFPGBdMtDLNkEhuyy"
    static let searchArticleURL = "https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=\(apiKey)"
    static let mostViewedURL = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=\(apiKey)")
    static let mostSharedURL = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/shared/1.json?api-key=\(apiKey)")
    static let mostEmailed = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=\(apiKey)")
}
