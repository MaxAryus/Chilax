//
//  NameFont.swift
//  Chilax
//
//  Created by Max Aryus on 15.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct NameFont: View {
    var body: some View {
        Image("ChilaxLogo")
            .resizable()
            .renderingMode(.original)
            .frame(width: 204, height: 90, alignment: .center)
    }
}

struct NameFont_Previews: PreviewProvider {
    static var previews: some View {
        NameFont()
    }
}
