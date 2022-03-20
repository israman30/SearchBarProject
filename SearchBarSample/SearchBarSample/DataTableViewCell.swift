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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(teams: Teams) {
        imagePic.image = teams.photoEquipo
        equipoLbl.text = teams.equipo
        descriptionTeamLbl.text = teams.descriptionTeam
    }

}
