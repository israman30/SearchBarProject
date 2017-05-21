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
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ItemTableViewCell
       
        let array = filterArray[indexPath.row]
        cell.titleLbl.text = array.name
        cell.subTitleLbl.text = array.kind
        
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text == "" {
            filterArray = animals
            tableView.reloadData()
        } else {
            filterArray = animals.filter({ (species) -> Bool in
                return species.name.lowercased().contains(searchController.searchBar.text!.lowercased())
            })
        }
        tableView.reloadData()
    }

}

