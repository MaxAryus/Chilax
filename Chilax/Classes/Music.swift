//
//  Music .swift
//  Chilax
//
//  Created by Max Aryus on 18.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation
import SwiftUI

class Music: Identifiable, ObservableObject {
    
    let title: String
    let length: String
    var isPlayed: Bool
    let category: Categories
    let id: String // Contains the audio file name
    
    init(title: String, length: String, isPlayed: Bool, category: Categories, id: String) {
        self.title = title
        self.length = length
        self.isPlayed = isPlayed
        self.category = category
        self.id = id

    }
    
}
