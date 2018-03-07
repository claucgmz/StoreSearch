//
//  SearchResultResponse.swift
//  StoreSearch
//
//  Created by Caludia Carrillo on 3/7/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import ObjectMapper

struct SearchResultResponse: Mappable {
  var results: [SearchResult]?
  init?(map: Map) {
  }
  mutating func mapping(map: Map) {
    results <- map["results"]
  }
}
