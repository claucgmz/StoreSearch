//
//  StoreSearchServices.swift
//  StoreSearch
//
//  Created by Caludia Carrillo on 3/7/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class StoreSearchServices {
  func search(for term: String, kind: String, onSuccess: @escaping ([SearchResult]) -> Void, onFailure: @escaping (Error) -> Void) {
    Alamofire.request(StoreSearchRouter.search(term: term, kind: kind)).validate()
      .responseObject(completionHandler: { (response: DataResponse<SearchResultResponse>) in
        switch response.result {
        case .success:
          let results = response.result.value
          if let items = results?.results {
            onSuccess(items)
          }
        case .failure(let error):
          onFailure(error)
        }
      })
  }
}
