//
//  SearchedArticles.swift
//  SICPA Articles App
//
//  Created by User on 10/06/2022.
//

import Foundation

struct SearchedArticles : Codable {
    let status : String?
    let copyright : String?
    let response : Response?
}

struct Response : Codable {
    let docs : [Docs]?
}

struct Docs : Codable {
    let abstract : String?
    let pub_date : String?
}
