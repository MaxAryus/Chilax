//
//  MusicRowModel.swift
//  Chilax
//
//  Created by Max Aryus on 18.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct MusicRowModel: View {
    
    @State var song: Music
    var number: Int
    

    
    var body: some View {
        HStack {
            Text(String(self.number))
                .foregroundColor(.white)
                .padding([.leading, .trailing], 10)
                .opacity(0.8)
            VStack(alignment: .leading) {
                HStack {
                    Text(self.song.title)
                        .font(.custom("OpenSans-ExtraBold", size: 11))
                        .foregroundColor(.black)
                    Image(systemName: "play.circle.fill")
                        .foregroundColor(.black)
                        .padding(.top, 3)
                }
                HStack {
                    Text("Beautiful Lies")
                        .fontWeight(.thin)
                        .foregroundColor(.black)
                        .font(.custom("system", size: 9))
                }
            }
            Spacer()
            Text(self.song.length)
                .fontWeight(.light)
                .foregroundColor(.black)
                .font(.custom("system", size: 10))
                .padding()
            
        }
        .background(musicRowBg)
        .cornerRadius(20)
        .frame(height: 41)
        .shadow(color: shadowColor, radius: 6, x: 0, y: 2)
    }
}

struct MusicRowModel_Previews: PreviewProvider {
    static var previews: some View {
        MusicRowModel(song: musicData[0], number: 01).previewLayout(.sizeThatFits)
    }
}
