//
//  Model.swift
//  SearchBarSample
//
//  Created by Israel Manzo on 5/20/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation
import UIKit

class Teams {
    
    var equipo: String
    var descriptionTeam: String
    var photoEquipo: UIImage?
    
    init(equipo: String, descriptionTeam: String, photoEquipo: UIImage?) {
        self.equipo = equipo
        self.descriptionTeam = descriptionTeam
        self.photoEquipo = photoEquipo
    }
}

var teams: [Teams] = [
    
    Teams(equipo: "Barcelona SC",
          descriptionTeam: "Barcelona is the most successful football team in Ecuador, having won the Serie A title a record 15 times, most recently in 2016. They have also won six regional titles (five in the professional era), and were the first Ecuadorian club to make it to the Copa Libertadores finals, having done so twice.",
          photoEquipo: UIImage(named:"barcelonaSC")),
    Teams(equipo: "CS Emelec",
          descriptionTeam: "Emelec has won thirteen Serie A titles, holding the record of doing so in all decades in which the Serie A has been played. They also have won seven regional titles (record in their region), a record-tying 5 of them in the professional era.",
          photoEquipo: UIImage(named: "CSemelec")),
    Teams(equipo: "Boca Jr",
          descriptionTeam: "Club Atlético Boca Juniors is an Argentine sports club based in the La Boca neighbourhood of Buenos Aires. Although many activities are hosted by the club, Boca Juniors is mostly known for its professional football team which, since it was promoted in 1913, has always played in the Argentine Primera División, becoming the most successful team of Argentina in number of official titles, with 65 won to date. National titles won by Boca Juniors include 31 Primera División championships, and 12 domestic cups. Boca Juniors also owns an honorary title awarded by the Argentine Football Association for their successful tour of Europe in 1925.",
          photoEquipo: UIImage(named: "bocaJr")),
    Teams(equipo: "River Plate",
          descriptionTeam: "Club Atlético River Plate is an Argentine sports club based in the Núñez neighborhood of Buenos Aires, and named after the city's estuary, Río de la Plata. Although many sports are practiced at the club, River is best known for its professional football team, which has won the most domestic competitions in Argentina with 36 league titles in the top division, 2 second division championships and 9 national cups. At international level, River Plate has won a total of 16 official titles.",
          photoEquipo: UIImage(named: "River")),
    Teams(equipo: "Flamengo",
          descriptionTeam: "Clube de Regatas do Flamengo, commonly referred to as Flamengo, is a Brazilian sports club based in Rio de Janeiro. Their most significant sporting outlet is the football team, which plays in the Campeonato Brasileiro Série A, being one of the only four clubs to have never been relegated, along with Santos, São Paulo and Cruzeiro.",
          photoEquipo: UIImage(named: "flamengo")),
    Teams(equipo: "Sao Paulo",
          descriptionTeam: "As for international titles, São Paulo is the most successful team from Brazil, with 12 international titles. It is also one of the most successful South American clubs in terms of overall titles, having won 21 state titles, six Brasileirão titles, three Copa Libertadores titles, one Copa Sudamericana, one Supercopa Libertadores, one Copa CONMEBOL, one Copa Masters CONMEBOL, two Recopa Sudamericanas, two Intercontinental Cups and one FIFA Club World Cup.",
          photoEquipo: UIImage(named: "saoPaulo")),
    Teams(equipo: "Atletico Nacional",
          descriptionTeam: "Club Atlético Nacional S. A., also known as Atlético Nacional, is a Colombian professional football team based in Medellín. The club is one of only three teams to have played in every first division tournament in the country's history, the other two teams being Millonarios and Santa Fe.",
          photoEquipo: UIImage(named: "atlNac")),
    Teams(equipo: "America de Cali",
          descriptionTeam: "Sociedad Anónima Deportiva América S. A., best known as América de Cali, is a Colombian football team based in Cali. In 2017, the team will play in the Categoría Primera A after having been promoted. They play their home games at the Olímpico Pascual Guerrero stadium.",
          photoEquipo: UIImage(named: "americaCali")),
    Teams(equipo: "U de Chile", descriptionTeam: "The club was founded on May 24, 1927. Universidad de Chile is one of the most successful and popular football clubs in Chile, having won the league title 18 times.[2] In the last 10 years, the team has been crowned champion six times, including their undefeated run to the 2011 Copa Sudamericana title. The team has been throughout its history associated with the blue colour, also present on the logo, which was officially adopted in 1943. The club rivalries are with Colo-Colo and Universidad Católica, with whom they regularly contest the Santiago derbies known as Clásicos.", photoEquipo: UIImage(named: "udeChile")),
    Teams(equipo: "Colo Colo", descriptionTeam: "Club Social y Deportivo Colo-Colo (Spanish pronunciation: [colo colo]) is a Chilean football club based in Macul, Santiago. Founded in 1925, they play in the Chilean Primera División, from which they have never been relegated.[1] The team plays its home games at Estadio Monumental David Arellano since 1989.[2] Colo-Colo is regarded as the most successful club of Chilean football.", photoEquipo: UIImage(named: "colocolo"))
    
]
