//
//  OnboardingScreenOne.swift
//  Chilax
//
//  Created by Max Aryus on 15.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

    

struct OnboardingScreenOne: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack {
                    NameFont()
                    Text("Sleep with music").font(.custom("Helvetica", size: 26))
                }
                
                Spacer()
                HStack {
                   Image("first")
                    .aspectRatio(contentMode: .fill)
                }
    
            }.edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Spacer()
                VStack {
                    Spacer()
                    HStack {
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(grayDots)
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(yellowDots)
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(grayDots)
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(grayDots)
                    }.frame(width: 113, height: 14)
                            Button(action: {
                                withAnimation() {
                                    self.viewRouter.currentPage = "onboardingScreenTwo"
                                }
                            }) {
                                Image("nextBlack")
                                    .renderingMode(.original)
                                    .resizable()
                                    .imageScale(.large)
                                    .frame(width: 201, height: 56, alignment: .center)
                                    .padding(.top, 30)
                                    
                            }
                }.frame(width: 201, height: 104, alignment: .center).padding(.bottom,  30)
                
            }
        }
    }
}

struct OnboardingScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenOne()
    }
}



