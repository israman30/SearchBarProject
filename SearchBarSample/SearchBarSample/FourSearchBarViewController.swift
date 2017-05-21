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

class FourSearchBarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        searchBarGenerate()
        
    }
    
    func searchBarGenerate(){
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Name", "Description"]
        searchBar.selectedScopeButtonIndex = 0
        
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
    }
    
    // MARK: - Search Bar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        if searchText.isEmpty {
            tableView.reloadData()
        } else {
        
            filteringTableView(index: searchBar.selectedScopeButtonIndex, text: searchText)
            tableView.reloadData()
        }
    }
    
    func filteringTableView(index: Int, text: String){
        switch index {
        case selectScoope.name.rawValue:
            teams = teams.filter({ (names: Teams) -> Bool in
                return names.equipo.lowercased().contains(text.lowercased())
            })
            tableView.reloadData()
        case selectScoope.name.rawValue:
            teams = teams.filter({ (description:Teams) -> Bool in
                return description.descriptionTeam.lowercased().contains(text.lowercased())
            })
            tableView.reloadData()
        default:
            break
        }
    }

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
        
        cell.equipoLbl.text = team.equipo
        cell.descriptionTeamLbl.text = team.descriptionTeam
        cell.imagePic.image = team.photoEquipo
        
        return cell
    }
  
}
