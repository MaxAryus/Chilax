//
//  OnboardingView.swift
//  Chilax
//
//  Created by Max Aryus on 14.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    var subviews = [
        UIHostingController(rootView: Subview(imageString: "first")),
        UIHostingController(rootView: Subview(imageString: "second")),
        UIHostingController(rootView: Subview(imageString: "third"))
    ]
    
    var body: some View {
        PageViewController(viewControllers: subviews)
            
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
