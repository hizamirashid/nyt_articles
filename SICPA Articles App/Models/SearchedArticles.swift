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

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case copyright = "copyright"
        case response = "response"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        response = try values.decodeIfPresent(Response.self, forKey: .response)
    }

}

struct Response : Codable {
    let docs : [Docs]?

    enum CodingKeys: String, CodingKey {

        case docs = "docs"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        docs = try values.decodeIfPresent([Docs].self, forKey: .docs)
    }

}

struct Docs : Codable {
    let abstract : String?
    let pub_date : String?

    enum CodingKeys: String, CodingKey {

        case abstract = "abstract"
        case pub_date = "pub_date"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
        pub_date = try values.decodeIfPresent(String.self, forKey: .pub_date)
    }

}
