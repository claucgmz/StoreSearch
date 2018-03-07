//
//  StoreSearchRouter.swift
//  StoreSearch
//
//  Created by Caludia Carrillo on 3/7/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import Alamofire

enum StoreSearchRouter: URLRequestConvertible {
  case search(term: String)
  static var basicURL = "https://itunes.apple.com/"
  var path: String {
    switch self {
    case .search:
      return "search"
    }
  }
  var parameters: [String: Any] {
    switch self {
    case .search(let term):
      return ["term": term]
    }
  }
  var method: HTTPMethod {
    switch self {
    case .search:
      return .get
    }
  }
  func asURLRequest() throws -> URLRequest {
    let url = try StoreSearchRouter.basicURL.asURL()
    var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    urlRequest.httpMethod = method.rawValue
    return try URLEncoding.methodDependent.encode(urlRequest, with: parameters)
  }
}
