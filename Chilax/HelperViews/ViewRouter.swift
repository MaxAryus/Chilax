//
//  ViewRouter.swift
//  Chilax
//
//  Created by Max Aryus on 15.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: String
    @Published var plying: Bool = false 
    @Published var musicList: Categories = .sleep
    
    init() {
        if !UserDefaults.standard.bool(forKey: "WelcomeFinished") {
            currentPage = "welcome"
        } else {
            currentPage = "discoverPage"
        }
    }
    
    
}
