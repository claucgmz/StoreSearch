//
//  SearchViewController.swift
//  StoreSearch
//
//  Created by Caludia Carrillo on 3/6/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class SearchViewController: UIViewController {
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  var searchResults = [SearchResult]()
  var hasSearch = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNibs()
    //Remove cell separators
    tableView.emptyDataSetDelegate = self
    tableView.emptyDataSetSource = self
    tableView.tableFooterView = UIView()
  }
  
  deinit {
    tableView.emptyDataSetSource = nil
    tableView.emptyDataSetDelegate = nil
  }
  
  private func registerNibs() {
    tableView.register(UINib(nibName: SearchResultCell.reusableID, bundle: nil), forCellReuseIdentifier: SearchResultCell.reusableID)
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
    return searchResults.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.reusableID, for: indexPath) as! SearchResultCell
    let result = searchResults[indexPath.row]
    cell.configure(with: result)
    return cell
  }
}

extension SearchViewController: DZNEmptyDataSetSource {
  func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
    return UIImage(named: "emptyBox")
  }
  
  func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
    return NSAttributedString(string: "No results")
  }
}

extension SearchViewController: DZNEmptyDataSetDelegate {
  func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
    return true
  }
}
