//
//  onboardingScreenThree.swift
//  Chilax
//
//  Created by Max Aryus on 15.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct OnboardingScreenThree: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack {
                    NameFont()
                    Text("Study with music").font(.custom("Helvetica", size: 26))
                }
                Spacer()
                HStack {
                    Image("third")
                }
                
            }
            VStack {
                Spacer()
                VStack {
                    HStack {
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(grayDots)
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(grayDots)
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(grayDots)
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(yellowDots)
                    }.frame(width: 113, height: 14)
                    Button(action: {
                        withAnimation() {
                            self.viewRouter.currentPage = "discoverPage"
                            UserDefaults.standard.set(true, forKey: "WelcomeFinished")
                        }
                    }) {
                        Image("nextBlack")
                            .renderingMode(.original)
                            .resizable()
                            .imageScale(.large)
                            .frame(width: 201, height: 56, alignment: .center)
                            .padding(.top, 30)
                            .padding(.bottom, 55)
                    }
                }.frame(width: 201, height: 104, alignment: .center)
                
            }
        }
    }
}

struct OnboardingScreenThree_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenThree()
    }
}
