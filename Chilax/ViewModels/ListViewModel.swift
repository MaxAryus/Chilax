//
//  ListViewModel.swift
//  Chilax
//
//  Created by Max Aryus on 18.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI
import AVKit
import MediaPlayer
import UIKit

struct ListViewModel: View {
    
    @EnvironmentObject private var viewRouter: ViewRouter
    
    @State private var titleText: String = "Sleeping Music"
    @State private var iconText: String = "moon.fill"
    @State private var imageText: String = "sleepingMusic"
    
    @State var presentSettingsSheet: Bool = false
    
    var body: some View {
        VStack{
            GeometryReader { geometry in
                ZStack {
                    Image(self.imageText)
                        .resizable()
                        .cornerRadius(20)
                        .offset(y: -30)
                        .shadow(radius: 6)
                        .edgesIgnoringSafeArea(.top)
                    VStack {
                        HStack {
                            Button(action: {
                                withAnimation {
                                    self.viewRouter.plying = false
                                    self.viewRouter.currentPage = "discoverPage"
                                }
                            }) {
                                BackButton()
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                            Button(action: {
                                self.presentSettingsSheet.toggle()
                            }) {
                                SettingsButton()
                                    .foregroundColor(.white)
                            }.sheet(isPresented: self.$presentSettingsSheet) {
                                SettingsViewModel(isPresented: self.$presentSettingsSheet)
                            }
                            
                        }.padding()
                        
                        Spacer()
                        
                        Image(self.iconText)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 45, height: 45, alignment: .center)
                            .foregroundColor(Color.white)
                            .padding(.top, -40)
                        
                        Text(self.titleText)
                            .font(.custom("", size: 27))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        
                        Spacer()
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height/5, alignment: .top)
                Spacer()
                
            }.frame(maxHeight: 140)

            
            ScrollView(showsIndicators: false) {
                
                ForEach(filterData(by: self.viewRouter.musicList)) { item in
                        if item.isPlayed == false {
                            MusicRowModel(song: item, number: 1)
                            .padding(.top, 10).padding([.trailing, .leading], 10)
                        } else if item.isPlayed == true{
                            MusicRowBlackModel(song: item, number: 1)
                            .padding(.top, 10).padding([.trailing, .leading], 10)
                        }
                }.padding(.top, 15)
                
            }.padding(.top, 32).padding(.bottom, -5)
            
            PlayerViewModel().background(CustomRoundedCorners(tl: 30, tr: 30, bl: 0, br: 0).fill(Color.white))
                .shadow(radius: 6)
            
        }.edgesIgnoringSafeArea(.bottom)
            .onAppear() {
                let text = setText(category: self.viewRouter.musicList)
                self.titleText = text["title"] ?? "Sleeping Music"
                self.iconText = text["icon"] ?? "meditation icon"
                self.imageText = text["image"] ?? "meditationMusic"
//                self.wasPlayedBefore = false
                
        }
        
    }
    
}


struct ListViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ListViewModel()
    }
}
