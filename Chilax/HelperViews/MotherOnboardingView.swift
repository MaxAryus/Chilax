//
//  MotherOnboardingView.swift
//  Chilax
//
//  Created by Max Aryus on 15.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct MotherOnboardingView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "welcome" {
                Welcome()
            } else if viewRouter.currentPage == "onboardingScreenOne" {
                OnboardingScreenOne()
                    .transition(.move(edge: .trailing))
            } else if viewRouter.currentPage == "onboardingScreenTwo" {
            OnboardingScreenTwo()
                .transition(.move(edge: .trailing))
            } else if viewRouter.currentPage == "onboardingScreenThree" {
                OnboardingScreenThree()
                    .transition(.move(edge: .trailing))
            } else if viewRouter.currentPage == "discoverPage" {
                DiscoverPage()
                    .transition(.move(edge: .bottom))
            } else if viewRouter.currentPage == "PlayerView" {
                PlayerView()
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

struct MotherOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        MotherOnboardingView().environmentObject(ViewRouter())
    }
}
