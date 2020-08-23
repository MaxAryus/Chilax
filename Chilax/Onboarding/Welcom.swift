//
//  Welcom.swift
//  Chilax
//
//  Created by Max Aryus on 15.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct Welcome: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("ChilaxLogo")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 200, height: 100)
                    .padding(.bottom, 50)
                Image("welcomePageText")
                Spacer()
                
            }
            
            VStack {
                Spacer()
                VStack {
                    HStack {
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(yellowDots)
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(grayDots)
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(grayDots)
                        Circle()
                            .size(width: 14, height: 14)
                            .foregroundColor(grayDots)
                    }.frame(width: 113, height: 14)
                            Button(action: {
                                withAnimation() {
                                    self.viewRouter.currentPage = "onboardingScreenOne"
                                }
                            }) {
                                Image("beginButton")
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

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
