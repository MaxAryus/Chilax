//
//  ViewRouter.swift
//  Chilax
//
//  Created by Max Aryus on 14.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var curretnPage: String
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            curretnPage = "onboardingView"
        } else {
            curretnPage = "contentView"
        }
    }
    
}
