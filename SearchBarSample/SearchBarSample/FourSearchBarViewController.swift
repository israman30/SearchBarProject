//
//  FourSearchBarViewController.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/20/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

enum selectScoope: Int {
    case name = 0
    case descriptionTeam = 1
}

class FourSearchBarViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchBarGenerate()
    }
    
    // MARK: - Search Bar Generator function
    private func searchBarGenerate() {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Name", "Description"]
        searchBar.tintColor = .white
        searchBar.barTintColor = .darkGray
        searchBar.selectedScopeButtonIndex = 0
        
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
    }
  
}
extension FourSearchBarViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Delegates & Data Sources
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataTableViewCell
        let team = teams[indexPath.row]
        cell.configure(teams: team)
        return cell
    }
    
}
extension FourSearchBarViewController: UISearchBarDelegate {
    
    // MARK: - Search Bar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            tableView.reloadData()
        } else {
            filteringTableView(index: searchBar.selectedScopeButtonIndex, text: searchText)
            tableView.reloadData()
        }
    }
    
    func filteringTableView(index: Int, text: String) {
        switch index {
        case selectScoope.name.rawValue:
            teams = teams.filter { $0.equipo.lowercased().contains(text.lowercased()) }
            tableView.reloadData()
        case selectScoope.descriptionTeam.rawValue:
            teams = teams.filter { $0.descriptionTeam.lowercased().contains(text.lowercased()) }
            tableView.reloadData()
        default:
            break
        }
    }
    
}
