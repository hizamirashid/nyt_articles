//
//  Article.swift
//  SICPA Articles App
//
//  Created by User on 10/06/2022.
//

import Foundation

struct ArticlesResult : Codable {
    let status : String?
    let copyright : String?
    let num_results : Int?
    let results : [Article]?
}

struct Article: Codable {
    let published_date : String?
    let title : String?
}
