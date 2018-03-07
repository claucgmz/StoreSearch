//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Caludia Carrillo on 3/6/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import ObjectMapper

struct SearchResult: Mappable {
  var name = ""
  var artistName = ""
  var kind = ""
  var genre = ""
  var thumbnailURL: URL?
  
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    name         <- map["trackName"]
    artistName   <- map["artistName"]
    kind         <- map["kind"]
    genre        <- map["primaryGenreName"]
    thumbnailURL <- (map["artworkUrl60"], URLTransform())
  }
}
