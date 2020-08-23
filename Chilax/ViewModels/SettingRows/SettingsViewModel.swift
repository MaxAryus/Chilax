//
//  SettingsViewModel.swift
//  Chilax
//
//  Created by Max Aryus on 10.05.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI
import WebKit

struct SettingsViewModel: View {
    
    @Binding var isPresented: Bool
    @State var webIsPresented: Bool = false
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    self.isPresented.toggle()
                }) {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .foregroundColor(.black)
                        .padding([.top,.leading], 30)
                }
                Spacer()
            }.padding(.bottom, 50)
            
            
            
            Button(action: {
                UserDefaults.standard.set(false, forKey: "WelcomeFinished")
            }) {
                HStack {
                    Image(systemName: "repeat")
                    .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.black)
                        .padding(.leading, 28)
                    
                    Text("Reset introduction")
                        .font(.custom("OpenSans-ExtraBold", size: 25))
                    .lineLimit(1)
                        .foregroundColor(.black)
                        .padding(.leading, 30)
                    Spacer()
                }
            }.padding(.bottom)
            
           
            Button(action: {
                if let url = URL(string: "https://www.aryussoftwareapplications.com/chilax/") {
                    UIApplication.shared.open(url)
                }
                
            }) {
                HStack {
                    Image(systemName: "person.2.fill")
                    .resizable()
                        .frame(width: 40, height: 30)
                        .foregroundColor(Color.black)
                        .padding(.leading, 20)
                    Text("About Us")
                        .font(.custom("OpenSans-ExtraBold", size: 25))
                        .foregroundColor(.black)
                        .padding(.leading, 30)
                    Spacer()
                }
                    
            }.padding(.bottom)
            Button(action: {
                if let url = URL(string: "https://www.aryussoftwareapplications.com/#macontactform") {
                    UIApplication.shared.open(url)
                }
                
            }) {
                HStack {
                    Image(systemName: "person.2")
                    .resizable()
                        .frame(width: 40, height: 30)
                        .foregroundColor(Color.black)
                        .padding(.leading, 20)
                    Text("Contact Us")
                        .font(.custom("OpenSans-ExtraBold", size: 25))
                        .foregroundColor(.black)
                        .padding(.leading, 30)
                    Spacer()
                }
                    
            }.padding(.bottom)
            
            Button(action: {
                if let url = URL(string: "https://www.aryussoftwareapplications.com/chilax-music/") {
                    UIApplication.shared.open(url)
                }
                
            }) {
                HStack {
                    Image(systemName: "music.note")
                    .resizable()
                        .frame(width: 20, height: 30)
                        .foregroundColor(Color.black)
                        .padding(.leading, 30)
                    Text("About the music")
                        .font(.custom("OpenSans-ExtraBold", size: 25))
                        .foregroundColor(.black)
                        .padding(.leading, 40)
                    Spacer()
                }
                    
            }.padding(.bottom)
            Spacer()
            
            HStack() {
                Spacer()
                VStack {
                    Spacer()
                    Text("Our music is provided by https://www.free-stock-music.com/")
                        .fontWeight(.medium)
                        .padding()
                        .multilineTextAlignment(.center)
                    Text("The artists are mentioned on our website above.")
                        .multilineTextAlignment(.center)
                        
                }
                Spacer()
            }
        }
    }
}

struct SettingsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsViewModel(isPresented: .constant(false))
    }
}
