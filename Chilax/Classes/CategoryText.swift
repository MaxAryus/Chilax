//
//  CategoryText.swift
//  Chilax
//
//  Created by Max Aryus on 01.05.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation

func setText(category: Categories) -> [String : String]{
    
    var names = [String : String]()
    
    switch category {
    case .sleep:
        names = ["title": "Sleeping Music", "icon": "moon.fill", "image": "sleepingMusic"]
    case .relax:
        names = ["title": "Relaxation Music", "icon": "meditation icon", "image": "meditationMusic"]
    case .study:
        names = ["title": "Study Music", "icon": "book.fill", "image": "studyingMusic"]
    default:
        names = ["title": "Sleeping Music", "icon": "moon.fill", "image": "sleepingMusic"]
    }
    
    return names
}


