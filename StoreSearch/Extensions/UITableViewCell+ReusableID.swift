//
//  UITableViewCell+ReusableID.swift
//  StoreSearch
//
//  Created by Caludia Carrillo on 3/6/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit

extension UITableViewCell {
  static var reusableID: String {
    return String(describing: self)
  }
}
