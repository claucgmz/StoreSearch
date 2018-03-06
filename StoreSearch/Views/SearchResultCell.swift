//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by Caludia Carrillo on 3/6/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
  @IBOutlet private weak var thumbnailView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var detailLabel: UILabel!
  
  func configure(with result: SearchResult) {
    nameLabel.text = result.name
    detailLabel.text = result.name
  }
}
