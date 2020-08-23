//
//  BackButton.swift
//  Chilax
//
//  Created by Max Aryus on 19.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        Image(systemName: "chevron.left")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .foregroundColor(.white)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton().previewLayout(.sizeThatFits)
    }
}
