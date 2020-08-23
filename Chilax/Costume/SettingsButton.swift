//
//  SettingsButton.swift
//  Chilax
//
//  Created by Max Aryus on 19.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct SettingsButton: View {
    var body: some View {
        Image(systemName: "gear")
            .resizable()
            .scaledToFit()
            
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton().previewLayout(.sizeThatFits)
            
    }
}
