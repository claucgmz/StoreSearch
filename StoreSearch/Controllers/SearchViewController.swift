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
  @IBOutlet weak private var searchBar: UISearchBar!
  @IBOutlet weak private var segmentedControl: UISegmentedControl!
  @IBOutlet weak private var tableView: UITableView!
  private var searchResults = [SearchResult]()
  private var hasSearch = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.becomeFirstResponder()
    registerNibs()
    tableView.emptyDataSetDelegate = self
    tableView.emptyDataSetSource = self
    //Remove cell separators
    tableView.tableFooterView = UIView()
  }
  
  deinit {
    tableView.emptyDataSetSource = nil
    tableView.emptyDataSetDelegate = nil
  }
  
  private func registerNibs() {
    tableView.register(UINib(nibName: SearchResultCell.reusableID, bundle: nil), forCellReuseIdentifier: SearchResultCell.reusableID)
  }
  
  // MARK - Action methods
  
  @IBAction func segmentChanged(_ sender: UISegmentedControl) {
    print("Segment changed: \(sender.selectedSegmentIndex)")
  }
  
}

extension SearchViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    guard let searchText = searchBar.text else {
      return
    }
    
    searchResults = []
    
    if !searchText.isEmpty {
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
    if hasSearch == true {
      return NSAttributedString(string: "No results")
    }
    return NSAttributedString(string: "No query search")
  }
}

extension SearchViewController: DZNEmptyDataSetDelegate {
  func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
    return true
  }
}
