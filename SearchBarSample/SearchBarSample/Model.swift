//
//  Model.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/20/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation

class Model {
    var equipo: String
    var descriptionTeam: String
    var photoEquipo: String
    init(equipo: String, descriptionTeam: String, photoEquipo: String) {
        self.equipo = equipo
        self.descriptionTeam = descriptionTeam
        self.photoEquipo = photoEquipo
    }

}
