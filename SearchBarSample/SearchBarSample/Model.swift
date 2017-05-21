//
//  Model.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/20/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation

class Teams {
    var equipo: String
    var descriptionTeam: String
    var photoEquipo: String
    init(equipo: String, descriptionTeam: String, photoEquipo: String) {
        self.equipo = equipo
        self.descriptionTeam = descriptionTeam
        self.photoEquipo = photoEquipo
    }

}

var teams: [Teams] = [
    Teams(equipo: "Barcelona SC", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "CS Emelec", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Boca Jr", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "River Plate", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Falmengo", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Sao Paulo", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Nacional", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Peniarol", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "U de Chile", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Colo Colo", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Universitario", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Alianza Lima", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Atletico Nacional", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Amrerica de Cali", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Bolivar", descriptionTeam: "", photoEquipo: ""),
    Teams(equipo: "Oriente Petrolero", descriptionTeam: "", photoEquipo: "")
]
