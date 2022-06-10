//
//  ArticleCell.swift
//  SICPA Articles App
//
//  Created by User on 10/06/2022.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    var articleViewModel: ArticleViewModel! {
        didSet {
            textLabel?.text = articleViewModel.title
            detailTextLabel?.text = articleViewModel.published_date
        }
    }
}


