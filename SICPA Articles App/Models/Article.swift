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
    let articles : [Article]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case articles = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        num_results = try values.decodeIfPresent(Int.self, forKey: .num_results)
        articles = try values.decodeIfPresent([Article].self, forKey: .articles)
    }

}

struct Article: Codable {
    let published_date : String?
    let title : String?

    enum CodingKeys: String, CodingKey {
        case published_date = "published_date"
        case title = "title"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}
