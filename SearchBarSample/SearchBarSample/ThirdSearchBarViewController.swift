//
//  ThirdSearchBarViewController.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/20/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class ThirdSearchBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    var filterArray = [String]()
    
    var searchController = UISearchController(searchResultsController: nil)
    
    var cities = [
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
        searchController.dimsBackgroundDuringPresentation = false
    
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive {
            return filterArray.count
        } else {
            return cities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if searchController.isActive {
            cell?.textLabel?.text = filterArray[indexPath.row]
            return cell!
        } else {
            cell?.textLabel?.text = cities[indexPath.row]
            return cell!
        }
    }
    
    func filterContentSearch(_ search: String){
        filterArray = cities.filter({ (city: String) -> Bool in
            return (city.lowercased().range(of: search.lowercased()) != nil)
        })
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentSearch(searchController.searchBar.text!)
        tableView.reloadData()
    }
}
