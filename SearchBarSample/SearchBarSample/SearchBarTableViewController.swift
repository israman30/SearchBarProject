//
//  SearchBarTableViewController.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/18/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class SearchBarTableViewController: UITableViewController {
    
    private let searchBar = UISearchBar()
    
    private let itemsOnTableView = [
        "Barcelona", "Real Madrid", "Manchester United",
        "Liverpool", "Bayer Munich", "Werde Bremme", "AC Milan",
        "Inter", "Benfica", "Sportin de Lisboa", "Boca Jr",
        "River Plate", "Flamengo", "Coritians", "U de Chile",
        "Colo Colo", "Barcelona", "Emelec", "Ateltico Medellin",
        "America de Cali", "Univeristario de Deporte", "Alianza Lima",
        "Cerro Portenio", "Olimpia", "Oriente Petrolero", "Bolivar",
        "Nacional", "Peniarol"
    ]
    
    private var filterArray = [String]()
    
    private var showResults = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createingSearchBar()
    }
    
    // MARK: - Creating a Search Bar function
    func createingSearchBar() {
        
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Enter Text Here"
        searchBar.delegate =  self
        
        searchBar.barStyle = .blackOpaque
        navigationController?.navigationBar.barTintColor = .yellow
        
        navigationItem.titleView = searchBar
    }

    // MARK: - Adding search function
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterArray = itemsOnTableView.filter {
            return $0.lowercased().range(of: searchText.lowercased()) != nil
        }
        
        if !searchText.isEmpty {
            showResults = true
            tableView.reloadData()
        } else {
            showResults = false
            tableView.reloadData()
        }
    }
    
}

extension SearchBarTableViewController {
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showResults {
            return filterArray.count
        } else {
            return itemsOnTableView.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if showResults {
            cell.textLabel?.text = filterArray[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = itemsOnTableView[indexPath.row]
            return cell
        }
    }
    
}
extension SearchBarTableViewController: UISearchBarDelegate {
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showResults = true
        searchBar.endEditing(true)
        self.tableView.reloadData()
    }
    
}
