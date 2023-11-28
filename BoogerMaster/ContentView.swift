//
//  ContentView.swift
//  BoogerMaster
//
//  Created by Urban Coder - AppDev 10 on 11/13/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var thumb = 50.0
    @State var randValue: Int = Int.random(in: 1...100)
    @State var results = ""
    @State var player:AVAudioPlayer?
    
    var body: some View {
        VStack {
            Image("nostril")
                .resizable()
                .frame(width:100, height: 100)
            Text("Put your kleenex as close to \(randValue) as possible")
            Slider(
                value: $thumb,
                in: 1...100,
                step: 1.0){
                    
                }minimumValueLabel: {
                    Text("1")
                }maximumValueLabel: {
                    Text("100")
                }
            //Text("\(Int(thumb))")
            Button("Catch Those Boogers!"){
                let missed = abs(randValue - Int(thumb))
                results = "You missed \(missed) boogers!"
                let sound = Bundle.main.path(forResource: "sneeze", ofType: "mp3")
                player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                player?.prepareToPlay()
                player?.play()
            }
            Text(results)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
