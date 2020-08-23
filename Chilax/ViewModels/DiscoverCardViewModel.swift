//
//  DiscoverCardViewModel.swift
//  Chilax
//
//  Created by Max Aryus on 17.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct DiscoverCardViewModel: View {
    
    var cardImage: String
    var cardText: String
    var cardIcon: String
    
    var body: some View {
        ZStack {
            Image(cardImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 281, height: 330, alignment: .center)
                .cornerRadius(15)
                .shadow(color: shadowColor, radius: 6, x: 0, y: 3)
            VStack {
                Image(systemName: cardIcon)
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: 35, height: 35, alignment: .center)
                    .padding()
                Text(cardText)
                    .foregroundColor(.white)
                    .font(.custom("SFProDisplay-Bold", size: 27))
                .padding(.bottom, 50)
            }
        }
    }
}

struct DiscoverCardViewModel_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverCardViewModel(cardImage: "studying music Kopie", cardText: "Study Music", cardIcon: "meditation icon").previewLayout(.sizeThatFits)
    }
}
