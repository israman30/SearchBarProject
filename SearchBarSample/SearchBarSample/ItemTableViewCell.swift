//
//  ItemTableViewCell.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/21/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var subTitleLbl: UILabel!
    
    func configure(animal: Animals) {
        titleLbl.text = animal.name
        subTitleLbl.text = animal.kind
    }

}
