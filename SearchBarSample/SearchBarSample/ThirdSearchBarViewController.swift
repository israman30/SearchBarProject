//
//  ThirdSearchBarViewController.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/20/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class ThirdSearchBarViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var filteredArray = [String]()
    
    private var searchController = UISearchController(searchResultsController: nil)
    
    private var cities = [
        "Guayaquil", "Quito",
        "New York", "San Francisco",
        "Rome", "Barcelona", "Madrid",
        "London", "Mexico", "Lima",
        "Buenos Aires", "Bogota", "Rio de Janerio",
        "Sao Paulo", "Montevideo", "Santiago", "Caracas",
        "Asuncion", "La Paz", "Paris", "Sidney", "Shangai",
        "Beijin", "Tokio", "Taipei", "Honolulu", "Geneva",
        "Milan", "Bool", "Stockolm", "Amsterdan",
        "Montecarlo", "Miami", "Cartagena",
        "Lisboa", "Florence", "Venezia", "St Monica",
        "Cuzco", "Moscow"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.barTintColor = .white
    
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

    }
}

extension ThirdSearchBarViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK - Delegates and Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? filteredArray.count : cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { fatalError("Cell doesn't exist") }
        
        if searchController.isActive {
            cell.textLabel?.text = filteredArray[indexPath.row]
        } else {
            cell.textLabel?.text = cities[indexPath.row]
        }
        return cell
    }
}

extension ThirdSearchBarViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    // MARK: - Filter function
    func filterContentSearch(_ search: String){
        filteredArray = cities.filter { $0.lowercased().range(of: search.lowercased()) != nil }
        tableView.reloadData()
    }
    
    // MARK - Update result on filter
    func updateSearchResults(for searchController: UISearchController) {
        filterContentSearch(searchController.searchBar.text ?? "")
        tableView.reloadData()
    }
    
}
