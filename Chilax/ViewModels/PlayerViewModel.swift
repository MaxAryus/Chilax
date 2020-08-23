//
//  PlayerViewModel.swift
//  Chilax
//
//  Created by Max Aryus on 20.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct PlayerViewModel: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var width : CGFloat = 10
    @State var title: String = ""
    @State private var player: AVAudioPlayer!
    @State private var index: Int = 0
    @State private var songs: [Music]!
    @State private var shuffle: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text("Now Playing")
                        .font(.custom("OpenSans-Bold", size: 15))
                        .foregroundColor(greenColor)
                        .padding(.bottom, 8)
                    Text("\(self.title)")
                        .font(.custom("OpenSans-Bold", size: 18))
                    Text("Beautiful Lies")
                        .font(.custom("OpenSansSemiBold", size: 9))
                        .foregroundColor(albumFontColor)
                        .padding(.bottom, 19)
                    
                    HStack {
                        
                        Button(action: {
                            self.shuffle.toggle()
                        }) {
                            Image(systemName: "repeat")
                                .imageScale(.large)
                                .foregroundColor(greenColor)
                                .padding([.leading,.top,.bottom, .trailing], 10)
                                .background(self.shuffle ? .black: Color.white.opacity(0)).cornerRadius(4)
                            
                        }
                        
                        Button(action: {
                            self.previous()
                        }) {
                            Image(systemName: "backward.fill")
                                .imageScale(.large)
                                .foregroundColor(.black)
                                .padding([.leading, .trailing], 10)
                        }
                        
                        Button(action: {
                                if self.player == nil {
                                    self.playAudio()
                                    if self.player != nil {
                                        self.player.play()
                                    }
                                    self.viewRouter.plying = true
                                } else if self.player.isPlaying {
                                    self.player.stop()
                                    self.viewRouter.plying = false
                                } else {
                                    self.viewRouter.plying = true
                                    self.player.play()
                                }
                            
                        }) {
                            Image(systemName: self.viewRouter.plying ? "pause.circle.fill" : "play.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.black)
                                .padding([.leading, .trailing], 10)
                        }
                        
                        
                        Button(action: {
                            self.next()
                        }) {
                            Image(systemName: "forward.fill")
                                .imageScale(.large)
                                .foregroundColor(.black)
                                .padding([.leading, .trailing], 10)
                        }
                        
                        Text("2:10")
                            .frame(width: 35, height: 35)
                            .font(.custom("OpenSansSemiBold", size: 15))
                            .padding([.leading, .trailing], 10)
                        
                    }
                    Spacer()
                    ZStack(alignment: .leading) {
                        Capsule().fill(Color.black.opacity(0.08)).frame(height: 8)
                        Capsule().fill(Color.black).frame(width: self.width, height: 8)
                        Circle().fill(Color.black).position(x: self.width, y: 8).frame(width: 16, height: 16)
                            
                            .gesture(DragGesture()
                                .onChanged({ (value) in
                                    
                                    guard self.songs != nil else { return }
                                    
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
                    }.padding(.bottom, 20)
                }
                Spacer()
            }.padding()
            Spacer()
            
        }.frame(height: 220)
            .padding(.bottom)
            .onAppear() {
                
                
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                    
                    if self.player == nil && self.viewRouter.plying == true {
                        self.playAudio()
                        if self.player != nil {
                            self.player.play()
                        }
                        UserDefaults.standard.set(true, forKey: "WasPlayedBefore")
                    }
                    
                    if self.player != nil {
                        //                        self.setupRemoteTransportControls()
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
            UserDefaults.standard.set("false", forKey: "WasPlayedBefore")
            if self.player != nil {
                self.player.pause()
                self.songs[self.index].isPlayed = false
            }
            self.width = 0
            self.viewRouter.plying = false
            
        }
        
    }
    
    func playAudio() {
        self.viewRouter.plying = false
        if self.player != nil {
            self.songs[self.index].isPlayed = false
        }
        self.width = 0
        self.songs = filterData(by: self.viewRouter.musicList)
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
            self.viewRouter.plying = true
            self.songs[self.index].isPlayed = true
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
        
        self.songs[self.index].isPlayed = false
        self.player.pause()
        if self.player != nil {
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
                    self.viewRouter.plying = false
                }
            } else if self.index < self.songs.count {
                self.index += 1
                self.playAudio()
                self.player.play()
            }
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

struct PlayerViewModel_Previews: PreviewProvider {
    static var previews: some View {
        PlayerViewModel().previewLayout(.sizeThatFits)
    }
}  
