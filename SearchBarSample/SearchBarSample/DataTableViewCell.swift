//
//  DataTableViewCell.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/20/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePic: UIImageView!
    
    @IBOutlet weak var equipoLbl: UILabel!

    @IBOutlet weak var descriptionTeamLbl: UILabel!
    
    func configure(teams: Teams) {
        imagePic.image = teams.photoEquipo
        equipoLbl.text = teams.equipo
        descriptionTeamLbl.text = teams.descriptionTeam
    }

}
