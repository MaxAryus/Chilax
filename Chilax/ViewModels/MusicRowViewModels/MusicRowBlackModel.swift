//
//  MusicRowBlackModel.swift
//  Chilax
//
//  Created by Max Aryus on 22.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct MusicRowBlackModel: View {
    
    @State var song: Music
    var number: Int
    
    var body: some View {
        HStack {
            Text("\(self.number)")
                .foregroundColor(.black)
                .padding([.leading, .trailing], 10)
                .opacity(0.8)
            VStack(alignment: .leading) {
                HStack {
                    Text(self.song.title)
                        .font(.custom("OpenSans-ExtraBold", size: 11))
                        .foregroundColor(.white)
                    Image(systemName: "play.circle.fill")
                        .foregroundColor(.white)
                        .padding(.top, 3)
                }
                HStack {
                    Text("Beautiful Lies")
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .font(.custom("system", size: 9))
                }
            }
            Spacer()
            Text(self.song.length)
                .fontWeight(.light)
                .foregroundColor(.white)
                .font(.custom("system", size: 10))
                .padding()
            
        }
        .background(Color.black)
        .cornerRadius(20)
        .frame(height: 41)
        .shadow(color: shadowColor, radius: 6, x: 0, y: 2)
    }
}

struct MusicRowBlackModel_Previews: PreviewProvider {
    static var previews: some View {
        MusicRowBlackModel(song: musicData[0], number: 01)
    }
}
