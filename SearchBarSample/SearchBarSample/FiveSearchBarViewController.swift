//
//  FiveSearchBarViewController.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/21/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

struct Animals {
    var name: String
    var kind: String
}

class FiveSearchBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var animals = [
        Animals(name: "Dog", kind: "Bulldog"),
        Animals(name: "Cat", kind: "Angora"),
        Animals(name: "Mouse", kind: "White mouse"),
        Animals(name: "Bird", kind: "Parrot"),
        Animals(name: "Lion", kind: "The King of Jungle"),
        Animals(name: "Shark", kind: "Great White"),
        Animals(name: "Pig", kind: "Mini One")
    ]
    
    private var filteredArray = [Animals]()
    
    private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredArray = animals
        
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemTableViewCell
        let data = filteredArray[indexPath.row]
        cell.configure(animal: data)
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text == "" {
            filteredArray = animals
        } else {
            filteredArray = animals.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        tableView.reloadData()
    }

}

