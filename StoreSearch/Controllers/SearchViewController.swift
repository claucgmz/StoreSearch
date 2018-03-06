//
//  SearchViewController.swift
//  StoreSearch
//
//  Created by Caludia Carrillo on 3/6/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  var searchResults = [SearchResult]()
  var hasSearch = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
}

extension SearchViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    guard let searchText = searchBar.text else {
      return
    }
    
    searchResults = []
    
    if searchText != "justin bieber" {
      for i in 0...2 {
        let result = SearchResult()
        result.artistName = searchText
        result.name = String(format:
          "Fake Result %d for '%@'", i, searchText)
        searchResults.append(result)
      }
    }
    hasSearch = true
    tableView.reloadData()
  }
}

extension SearchViewController: UITableViewDelegate {
  
}

extension SearchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if !hasSearch {
      return 0
    } else if searchResults.count == 0 {
      return 1
    }
    
    return searchResults.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell")
    if cell == nil {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "SearchResultCell")
    }
    
    if searchResults.count == 0 {
      cell.textLabel?.text = "Nothing found"
      cell.detailTextLabel?.text = "N-A-D-A"
    }
    else {
      let result = searchResults[indexPath.row]
      cell.textLabel?.text = result.name
      cell.detailTextLabel?.text = result.artistName
    }
    return cell
  }
}
