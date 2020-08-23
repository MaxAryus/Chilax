//
//  Subview.swift
//  Chilax
//
//  Created by Max Aryus on 14.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct Subview: View {
    
    var imageString: String

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image(self.imageString)
                .resizable()
                    .frame(width: geometry.size.width+2 ,height: geometry.size.height/2)
                    .offset(y: 2)
//                    .aspectRatio(contentMode: .fill)
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(imageString: "Gruppe2")
    }
}
