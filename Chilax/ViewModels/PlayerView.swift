//
//  PlayerView.swift
//  Chilax
//
//  Created by Max Aryus on 12.08.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI
import MediaPlayer


struct PlayerView: View {
    
    @State var width: CGFloat = 0
    
    @State private var player: AVAudioPlayer!
    @State private var index: Int = 0
    @State private var songs: [Music]!
    @State private var shuffle: Bool = false
    
    @State private var titleText: String = "Sleeping Music"
    @State private var iconText: String = "moon.fill"
    @State private var imageText: String = "sleepingMusic"
    
    @State private var category: Categories = .sleep
    
    var body: some View {
        VStack{
            Header(imageText: $imageText, titleText: $titleText, iconText: $iconText)
            
            ScrollView(showsIndicators: false) {
                ForEach(filterData(by: self.category)) { item in
                    MusicRowModel(song: item, number: 1)
                        .padding([.trailing, .leading, .top], 10)
                }
            }
            
            Player()
            
        }
        .onAppear() {
            self.category = self.checkUserDefaults()
            let text = setText(category: self.category)
            self.titleText = text["title"] ?? "Sleeping Music"
            self.iconText = text["icon"] ?? "meditation icon"
            self.imageText = text["image"] ?? "meditationMusic"
        }
    }
    
    func checkUserDefaults() -> Categories {
        let category = UserDefaults.standard.object(forKey: "category")
        var catValue: Categories = .sleep
        switch category as! String {
        case "sleep": catValue = .sleep
        case "study": catValue = .study
        case "relax": catValue = .relax
        case "meditation": catValue = .meditation
        default:
            catValue = .sleep
        }
        return catValue
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerView()
            PlayerView()
        }
    }
}

struct Header: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @Binding var imageText: String
    @Binding var titleText: String
    @Binding var iconText: String
    
    @State var presentSettingsSheet: Bool = false
    @State private var songs: [Music]!
    
    var body: some View {
        ZStack() {
            Image(self.imageText)
                .resizable()
                .cornerRadius(20)
                .shadow(radius: 6)
                .edgesIgnoringSafeArea(.top)
                .offset(y: -20)
            VStack {
                HStack {
                    
                    Button(action: {
                        withAnimation {
                            self.viewRouter.plying = false
                            self.viewRouter.currentPage = "discoverPage"
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30, alignment: .center)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.presentSettingsSheet.toggle()
                    }) {
                        Image(systemName: "gear")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30, alignment: .center)
                    }.sheet(isPresented: self.$presentSettingsSheet) {
                        SettingsViewModel(isPresented: self.$presentSettingsSheet)
                    }
                    
                }.padding(.bottom, 40).padding([.leading, .trailing], 20)
                Image(self.iconText)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45, alignment: .center)
                    .foregroundColor(Color.white)
                    .padding(.top, -40)
                
                Text(self.titleText)
                    .font(.custom("OpenSans-Bold", size: 27))
                    .foregroundColor(.white)
                    .padding(.top, 10)
            }
        }.frame(minHeight: 100, maxHeight: 200)
    }
}

struct Player: View {
    @State var title: String = ""
    @State private var shuffle: Bool = false
    @State var width : CGFloat = 0
    @State private var player: AVAudioPlayer!
    @State private var repeating: Bool = false
    @State private var songs: [Music]!
    
    @State private var index: Int = 0
    @State private var playPause: Bool = false
    var body: some View {
        ZStack() {
            CustomRoundedCorners(tl: 20, tr: 30, bl: 0, br: 0)
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.bottom)
                .frame(maxHeight: 250, alignment: .center)
                .shadow(radius: 6, x: 0, y: -6)
            VStack() {
                HStack() {
                    Spacer()
                    VStack() {
                        Text("Now Playing")
                            .font(.custom("OpenSans-Bold", size: 20))
                            .foregroundColor(greenColor)
                        Text("\(self.title)")
                            .font(.custom("OpenSans-Bold", size: 18))
                    }
                    Spacer()
                }
                
                HStack() {
                    Button(action: {
                        self.shuffle.toggle()
                    }) {
                        Image(systemName: "repeat")
                            .imageScale(.large)
                            .foregroundColor(greenColor)
                            .padding([.leading,.top,.bottom, .trailing], 20)
                            .background(self.shuffle ? Color.black.opacity(0.4) : Color.white.opacity(0)).cornerRadius(4)
                    }
                    
                    Button(action: {
                        self.previous()
                    }) {
                        Image(systemName: "backward.fill")
                            .imageScale(.large)
                            .foregroundColor(.black)
                            .padding([.leading, .trailing], 20)
                    }
                    
                    Button(action: {
                        self.playPause.toggle()
                        if self.player == nil {
                            self.playAudio()
                            if self.player != nil {
                                self.player.play()
                            }
                        } else if self.player.isPlaying {
                            self.player.stop()
                        } else {
                            self.player.play()
                        }
                    }) {
                        Image(systemName: self.updateplayPause())
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.black)
                            .padding([.leading, .trailing], 20)
                    }
                    
                    Button(action: {
                        self.next()
                    }) {
                        Image(systemName: "forward.fill")
                            .imageScale(.large)
                            .foregroundColor(.black)
                            .padding([.leading, .trailing], 20)
                    }
                    
                    Button(action: {
                        self.repeating.toggle()
                    }) {
                        Image(systemName: "shuffle")
                            .imageScale(.large)
                            .foregroundColor(greenColor)
                            .padding([.leading,.top,.bottom, .trailing], 20)
                            .background(self.repeating ? Color.black.opacity(0.4) : Color.white.opacity(0)).cornerRadius(4)
                    }
                    
                }
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.black.opacity(0.08)).frame(height: 8).frame(maxWidth: 350)
                    Capsule().fill(Color.black).frame(width: self.width, height: 8)
                    Circle().fill(Color.black).position(x: self.width, y: 10).frame(width: 20, height: 20)
                        
                        .gesture(DragGesture()
                            .onChanged({ (value) in
                                
//                                guard self.songs != nil else { return }
                                
                                let before = self.width
                                let x = value.location.x
                                if x < UIScreen.main.bounds.width - 30 {
                                    self.width = x
                                } else if x > UIScreen.main.bounds.width - 30 {
                                    self.width = before
                                } else if x == UIScreen.main.bounds.width - 30 {
                                    self.width = before
                                } else if x < UIScreen.main.bounds.width   {
                                    self.width = 0
                                }
                                
                                
                            }).onEnded({ (value) in
                                guard self.songs != nil else { return }
                                
                                let x = value.location.x
                                
                                let screen = UIScreen.main.bounds.width - 30
                                
                                if x < screen {
                                    let percent = x / screen
                                    self.player.currentTime = Double(percent) * self.player.duration
                                } else if x > screen {
                                    self.next()
                                }
                            }))
                }.padding([.bottom, .top], 20)
                
            }.onAppear() {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                    if self.player != nil {
                        self.setupRemoteTransportControls()
                        if self.player.isPlaying {
                            let screen = UIScreen.main.bounds.width - 30
                            let value = self.player.currentTime / self.player.duration
                            self.width = screen * CGFloat(value)
                            
                            if self.player.currentTime + 2 > self.player.duration {
                                self.next()
                                
                            }
                            
                        }
                    }
                }
            }
            .onDisappear() {
                if self.player != nil {
                    self.player.pause()
                }
            }
        }
        
    }
    
    func updateplayPause() -> String{
        if !self.playPause {
            return "play.circle.fill"
        } else {
            return "pause.circle.fill"
        }
    }
    
    func checkUserDefaults() -> Categories {
        let category = UserDefaults.standard.object(forKey: "category")
        var catValue: Categories = .sleep
        switch category as! String {
        case "sleep": catValue = .sleep
        case "study": catValue = .study
        case "relax": catValue = .relax
        case "meditation": catValue = .meditation
        default:
            catValue = .sleep
        }
        return catValue
    }
    
    func playAudio() {
        
        self.width = 0
        self.songs = filterData(by: self.checkUserDefaults())
        if self.songs.count >= 1 {
            let url = Bundle.main.path(forResource: self.songs[self.index].id, ofType: "mp3")
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!, isDirectory: false))
            self.title = self.songs[self.index].title
            self.songs[self.index].isPlayed = true
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
            } catch {
                print(error)
            }
        }
    }
    
    func previous() {
        self.songs[self.index].isPlayed = false
        self.player.pause()
        if self.index != 0 {
            self.index -= 1
            self.playAudio()
        } else if self.index == 0 {
            self.playAudio()
        }
        self.player.play()
        
    }
    
    func next() {
        self.player.pause()
        if self.player != nil && self.repeating == false {
            if self.index + 1 == self.songs.count {
                if self.shuffle {
                    self.index = 0
                    self.playAudio()
                    self.player.play()
                } else if self.shuffle == false {
                    
                    self.index = 0
                    //                    self.title = self.songs[self.index].title
                    self.player.currentTime = 0
                    self.width = 0
                    
                }
            } else if self.index < self.songs.count {
                self.index += 1
                self.playAudio()
                self.player.play()
            }
        } else if self.player != nil && self.repeating == true {
            self.index = Int.random(in: (0...self.songs.count))
            self.playAudio()
            self.player.play()
        }
        
    }
    
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()
        
        // Add handler for Play Command
        commandCenter.playCommand.addTarget { event in
            if self.player.rate == 0.0 {
                self.player.play()
                self.player.rate = 1.0
                return .success
            }
            return .commandFailed
        }
        
        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { event in
            if self.player.rate == 1.0 {
                self.player.pause()
                self.player.rate = 0.0
                return .success
            }
            return .commandFailed
        }
        
        
    }

}
