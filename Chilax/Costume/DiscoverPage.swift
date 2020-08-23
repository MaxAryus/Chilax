//
//  discoverPage.swift
//  Chilax
//
//  Created by Max Aryus on 15.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct DiscoverPage: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    VStack {
                        NameFont()
                            .padding(.bottom, 20)
                            .padding(.top)
                        HStack {
                            Text("DISCOVER")
                                .foregroundColor(.black)
                                .font(.custom("OpenSans-ExtraBold", size: 20))
                                .padding(.leading, 40)
                                .padding(.bottom)
                            Spacer()
                            
                        }
                        
                    }
                    
                    ScrollView(showsIndicators: false) {
                        HStack {
                            Spacer()
                            VStack (spacing: 20){
                                Button(action: {
                                    withAnimation {
                                        self.viewRouter.currentPage = "PlayerView"
                                        self.viewRouter.musicList = .study
                                        UserDefaults.standard.set("study", forKey: "category")
                                    }
                                    
                                }) {
                                    DiscoverCardViewModel(cardImage: "studying music", cardText: "Study Music", cardIcon: "book.fill")
                                    
                                }

                                Button(action: {
                                    withAnimation {
                                        self.viewRouter.currentPage = "PlayerView"
                                        self.viewRouter.musicList = .sleep
                                        UserDefaults.standard.set("sleep", forKey: "category")
                                    }
                                }) {
                                    DiscoverCardViewModel(cardImage: "Sleeping music", cardText: "Sleeping Music", cardIcon: "moon.fill")
                                }
                                
                                Button(action: {
                                    withAnimation {
                                        self.viewRouter.currentPage = "PlayerView"
                                        self.viewRouter.musicList = .meditation
                                        UserDefaults.standard.set("relax", forKey: "category")
                                    }
                                }) {
                                    ZStack {
                                        Image("meditationMusic")
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 281, height: 330, alignment: .center)
                                            .cornerRadius(15)
                                            .shadow(color: shadowColor, radius: 6, x: 0, y: 3)
                                        VStack {
                                            Image("meditation icon")
                                                .renderingMode(.original)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 35, height: 35, alignment: .center)
                                                .padding()
                                            Text("Relaxation Music")
                                                .foregroundColor(.white)
                                                .font(.custom("SFProDisplay-Bold", size: 27))
                                                .padding(.bottom, 50)
                                        }
                                    }
                                }
                                
                                                                
                                
                            }
                            Spacer()
                            
                        }
                        
                    }
                }
            }
        }
    }
}

struct DiscoverPage_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPage()
    }
}
