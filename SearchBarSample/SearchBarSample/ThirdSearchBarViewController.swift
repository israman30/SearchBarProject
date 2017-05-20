//
//  ThirdSearchBarViewController.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/20/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class ThirdSearchBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cities = ["Guayaquil", "Quito", "New York", "San Francisco", "Rome", "Barcelona", "Madrid", "London", "Mexico", "Lima", "Buenos Aires", "Bogota", "Rio de Janerio", "Sao Paulo", "Montevideo", "Santiago", "Caracas", "Asuncion", "La Paz", "Paris", "Sidney", "Shangai", "Beijin", "Tokio", "Taipei", "Honolulu", "Geneva", "Milan", "Bool", "Stockolm", "Amsterdan", "Montecarlo", "Miami", "Cartagena", "Lisboa", "Florence", "Venezia"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = cities[indexPath.row]
        
        return cell!
    }
}
