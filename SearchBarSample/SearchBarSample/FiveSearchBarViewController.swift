//
//  FiveSearchBarViewController.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/21/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class FiveSearchBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    struct Animals {
        var name = String()
        var kind = String()
    }
    
    var animals = [
        Animals(name: "Dog", kind: "Bulldog"),
        Animals(name: "Cat", kind: "Angora"),
        Animals(name: "Mouse", kind: "White mouse"),
        Animals(name: "Bird", kind: "Parrot"),
        Animals(name: "Lion", kind: "The King of Jungle"),
        Animals(name: "Shark", kind: "Great White"),
        Animals(name: "Pig", kind: "Mini One")
    ]
    
    var filterArray = [Animals]()
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterArray = animals
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = filterArray[indexPath.row].name
        cell.detailTextLabel?.text = filterArray[indexPath.row].kind
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text == "" {
            filterArray = animals
            tableView.reloadData()
        } else {
            filterArray = animals.filter({ $0.name.lowercased().contains(searchController.searchBar.text!.lowercased())})
        }
        tableView.reloadData()
    }

}

