//
//  FilterMusicHelper.swift
//  Chilax
//
//  Created by Max Aryus on 18.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation
import SwiftUI

enum Categories {
    case study
    case sleep
    case meditation
    case relax
}

let musicData: [Music] =  [
    Music(title: "Traces", length: "2:10", isPlayed: false, category: .sleep, id: "ES_Traces-EverSoBlue"),
    Music(title: "Mayweather", length: "2:01", isPlayed: false, category: .sleep, id: "ES_Mayweather-warmkeys"), 
    Music(title: "HotN'Sweet", length: "3:40", isPlayed: false, category: .meditation, id: "ES_HotN'Sweet-ParkLane"),
    Music(title: "Prehistory", length: "4:01", isPlayed: false, category: .sleep, id: "glitch-prehistory"),
    Music(title: "Nightwalker", length: "5:11", isPlayed: false, category: .sleep, id: "nightwalker"),
    Music(title: "Midsommar", length: "3:54", isPlayed: false, category: .sleep, id: "scott-buckley-midsommar"),
    Music(title: "Cloud Nine", length: "3:33", isPlayed: false, category: .sleep, id: "hayden-folker-cloud-nine"),
    Music(title: "Grace", length: "3:14", isPlayed: false, category: .sleep, id: "hayden-folker-grace"),
    Music(title: "Drifting Away", length: "2:49", isPlayed: false, category: .sleep, id: "hayden-folker-drifting-away"),
    Music(title: "Herle Hæmle’heje Vi Haij", length: "3:17", isPlayed: false, category: .sleep, id: "soimanislander-lovely-secrets-we-had"),
    Music(title: "Undertow", length: "4:09", isPlayed: false, category: .sleep, id: "scott-buckley-undertow"),
    Music(title: "Childhood", length: "2:17", isPlayed: false, category: .sleep, id: "scott-buckley-childhood"),
    Music(title: "Winter Joy", length: "2:53", isPlayed: false, category: .sleep, id: "keys-of-moon-winter-joy"),
    Music(title: "Ethereal", length: "3:36", isPlayed: false, category: .sleep, id: "punch-deck-ethereal"),
    Music(title: "chill.", length: "3:52", isPlayed: false, category: .study, id: "sakura-hz-chill"),
    Music(title: "Deep In The Night", length: "2:29", isPlayed: false, category: .study, id: "chillin_wolf-deep-in-the-night"),
    Music(title: "How About A Goodnight Kiss?", length: "2:26", isPlayed: false, category: .study, id: "chillin_wolf-how-about-a-goodnight-kiss"),
    Music(title: "Calm Waters", length: "2:09", isPlayed: false, category: .study, id: "purrple-cat-calm-waters"),
    Music(title: "Black Cherry", length: "3:04", isPlayed: false, category: .study, id: "purrple-cat-black-cherry"),
    Music(title: "Vintage Memories", length: "2:05", isPlayed: false, category: .study, id: "schematist-vintage-memories"),
    Music(title: "Caramellow", length: "2:26", isPlayed: false, category: .study, id: "purrple-cat-caramellow"),
    Music(title: "Late Night Latte", length: "3:13", isPlayed: false, category: .study, id: "purrple-cat-late-night-latte"),
    Music(title: "Equinox", length: "2:19", isPlayed: false, category: .study, id: "purrple-cat-equinox"),
    Music(title: "Green Tea", length: "3:17", isPlayed: false, category: .study, id: "purrple-cat-green-tea"),
    Music(title: "Surface Level", length: "3:17", isPlayed: false, category: .study, id: "schematist-surface-level"),
    Music(title: "Fragile", length: "3:24", isPlayed: false, category: .study, id: "keys-of-moon-fragile"),
    Music(title: "Trees", length: "1:34", isPlayed: false, category: .study, id: "vlad-gluschenko-trees"),
    Music(title: "Slow Grind", length: "3:08", isPlayed: false, category: .study, id: "ron-gelinas-chillout-lounge-slow-grind"),
    Music(title: "Calm Waters", length: "2:09", isPlayed: false, category: .relax, id: "purrple-cat-calm-waters"),
    Music(title: "Fragile", length: "3:24", isPlayed: false, category: .relax, id: "keys-of-moon-fragile"),
    Music(title: "I Don’t Need U 2 Say Anything", length: "2:23", isPlayed: false, category: .relax, id: "le-gang-i-dont-need-u-2-say-anything"),
    Music(title: "Idle June", length: "2:32", isPlayed: false, category: .relax, id: "schematist-idle-june"),
    Music(title: "Weekend", length: "2:26", isPlayed: false, category: .relax, id: "inossi-weekend"),
    Music(title: "Daylight", length: "3:31", isPlayed: false, category: .relax, id: "jay-someday-daylight"),
    Music(title: "Trees", length: "1:34", isPlayed: false, category: .relax, id: "vlad-gluschenko-trees"),
    Music(title: "Sunset Eyes", length: "2:18", isPlayed: false, category: .relax, id: "inossi-sunset-eyes"),
    Music(title: "Modern Love", length: "2:29", isPlayed: false, category: .relax, id: "jay-someday-modern-love"),
    Music(title: "Sweet", length: "2:37", isPlayed: false, category: .relax, id: "liqwyd-sweet"),
    Music(title: "Reflection", length: "4:50", isPlayed: false, category: .relax, id: "domiko-reflection"),
    Music(title: "Ready For Summer", length: "4:37", isPlayed: false, category: .relax, id: "roa-music-ready-for-summer")
]


func filterData(by category: Categories) -> [Music]{
    var filteredMusicData = [Music]()
    
    for data in musicData {
        if data.category == category {
            filteredMusicData.append(data)
        }
    }
    return filteredMusicData
}
