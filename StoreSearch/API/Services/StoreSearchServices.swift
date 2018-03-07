//
//  StoreSearchServices.swift
//  StoreSearch
//
//  Created by Caludia Carrillo on 3/7/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import Alamofire

class StoreSearchServices {
  func getSearch() {
    Alamofire.request(StoreSearchRouter.search(term: "metallica"))
      .validate()
      .responseJSON(completionHandler: {
      response in
        switch response.result {
        case .success:
          print("validate!!")
        case .failure(let error):
          print(error)
        }
    })
  }
}
