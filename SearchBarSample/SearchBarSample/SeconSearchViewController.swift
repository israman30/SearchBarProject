//
//  SeconSearchViewController.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/20/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class SeconSearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var tableData = [
            "Ecuador", "USA", "Mexico",
            "Canada", "Colombia", "Venezuela",
            "Peru", "Brasil", "Chile", "Bolivia",
            "Argentina", "Uruguay", "Paraguay",
            "Guatemala", "El Salvador", "Honduras",
            "Nicargua", "Panama", "Costa Rica",
            "Cuba", "Rep Dominicana", "Granada",
            "Haiti", "Bahamas", "Trinidad Tobago"
    ]
    
    private var isSearching = false
    
    private var filterData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        searchBar.returnKeyType = .done
        searchBar.barTintColor = .black

    }
}
extension SeconSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK - Delegates & Data Source fuctions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return filterData.count
        }
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { fatalError("Cell doesn't exist") }
        
        if isSearching {
            cell.textLabel?.text = filterData[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = tableData[indexPath.row]
        }
        return cell
    }
    
}
extension SeconSearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            isSearching = true
            filterData = tableData.filter({ (text) -> Bool in
                return text.lowercased().range(of: searchText.lowercased()) != nil
            })
            tableView.reloadData()
        }
    }
    
}
