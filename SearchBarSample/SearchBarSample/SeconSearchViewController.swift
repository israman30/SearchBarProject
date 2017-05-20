//
//  SeconSearchViewController.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/20/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class SeconSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var tableData = ["Ecuador", "USA", "Mexico", "Canada", "Colombia", "Venezuela", "Peru", "Brasil", "Chile", "Bolivia", "Argentina", "Uruguay", "Paraguay", "Guatemala", "El Salvador", "Honduras", "Nicargua", "Panama", "Costa Rica", "Cuba", "Rep Dominicana", "Granada", "Haiti", "Bahamas", "Trinidad Tobago"]
    
    var isSearching = false
    
    var filterData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.barTintColor = UIColor.black

    }

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if isSearching {
            cell?.textLabel?.text = filterData[indexPath.row]
            return cell!
        } else {
            cell?.textLabel?.text = tableData[indexPath.row]
        }
            return cell!
    }
    
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
