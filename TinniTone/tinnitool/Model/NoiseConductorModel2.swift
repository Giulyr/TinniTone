//
//  NoiseConductorModel2.swift
//  tinnitool
//
//  Created by Marcelo Esposito on 18/02/22.
//

import AudioKit
import AudioKitEX
import SoundpipeAudioKit
import SwiftUI

enum NoiseType : Identifiable {
    case white, pink, brown
    var id: Self {self}
}


class NoiseConductor: ObservableObject {
    
//    MARK: - parameters
    
    var whiteNoise = WhiteNoise()
    var pinkNoise = PinkNoise()
    var brownNoise = BrownianNoise()
    let engine = AudioEngine()
    var mixer = Mixer()

    
    
    @Published var selectedNoiseType : NoiseType = .white {
        didSet{
            switch selectedNoiseType {
            case .white:
                pinkNoise.stop()
                brownNoise.stop()
                isPlaying = false
            case .pink:
                whiteNoise.stop()
                brownNoise.stop()
                isPlaying = false
            case .brown:
                whiteNoise.stop()
                pinkNoise.stop()
                isPlaying = false
                
            }
        }
    }
    
    
    
    @Published var volume: AUValue = 0.0
    {
        didSet{
            
            UserDefaults.standard.set(self.volume, forKey: "volume")
            
            switch selectedNoiseType {
            case .white:
                whiteNoise.amplitude = (self.volume)*0.2
                pinkNoise.amplitude = 0.0
                brownNoise.amplitude = 0.0
            case .pink:
                whiteNoise.amplitude = 0.0
                pinkNoise.amplitude = self.volume
                brownNoise.amplitude = 0.0
            case .brown:
                whiteNoise.amplitude = 0.0
                pinkNoise.amplitude = 0.0
                brownNoise.amplitude = self.volume
            }
        }
    }
    
    @Published var isPlaying: Bool = false {
        didSet {
            if !isPlaying {
//                space left for datalogging functions
                
                
                
                
                
                whiteNoise.stop()
                pinkNoise.stop()
                brownNoise.stop()
            } else {
//                space left for datalogging functions
                
                
                
                
                
                switch selectedNoiseType {
                case .white:
                        whiteNoise.amplitude = (self.volume)*0.3
                    whiteNoise.start()
                    pinkNoise.stop()
                    brownNoise.stop()
                case .pink:
                    whiteNoise.stop()
                    pinkNoise.amplitude = self.volume
                    pinkNoise.start()
                    brownNoise.stop()
                case .brown:
                    whiteNoise.stop()
                    pinkNoise.stop()
                    brownNoise.amplitude = self.volume
                    brownNoise.start()
            }
        }
    }
}
    
//    MARK: - methods
    
    init() {
        
        
        
        do{
            try  Settings.session.setCategory(.playback, options: .mixWithOthers)
        } catch {
            print("Couldn't set session to playback")
        }
       
        
        mixer.addInput(whiteNoise)
        mixer.addInput(pinkNoise)
        mixer.addInput(brownNoise)
        
        engine.output = mixer
        

        
    
    }
    
    func start() {
        
        
        if (UserDefaults.standard.float(forKey: "volume") != 0.0) {
            self.volume = UserDefaults.standard.float(forKey: "volume")
        }
 
        whiteNoise.amplitude = self.volume
        pinkNoise.amplitude = self.volume
        brownNoise.amplitude = self.volume

        do{
            try engine.start()
        } catch {
            Log("Engine couldn't start")
        }
        
    }
    
    func stop(){
        engine.stop()
    }
}

// MARK: - testing view, to delete
struct NoiseConductorView2: View {
    @State var volNoise: AUValue = 0.3
    @StateObject var conductor = NoiseConductor()
    var body: some View {
        VStack{


            Spacer()
            Button{
                self.conductor.isPlaying.toggle()
            }label:{
                (conductor.isPlaying ? Image(systemName: "pause.fill").font(.system(size: 70)) : Image(systemName: "play.fill").font(.system(size: 70)))
            }
            Spacer()
            HStack{
                Text("Select Noise: ")

            Picker(selection: self.$conductor.selectedNoiseType) {
                Text("White Noise").tag(NoiseType.white)
                Text("Pink Noise").tag(NoiseType.pink)
                Text("Brown Noise").tag(NoiseType.brown)
            } label: {
                Text("Select noise: ")
            }
            }
            Spacer()

            Slider(value: self.$conductor.volume, in: 0...volNoise).padding()

            Spacer()

        }.onAppear {
            self.conductor.start()
        }.onDisappear {
            self.conductor.stop()
        }
    }
}

struct NoiseConductorView2_Previews: PreviewProvider {
    static var previews: some View {
        NoiseConductorView2()
            .preferredColorScheme(.light)
        NoiseConductorView2()
            .preferredColorScheme(.dark)
    }
}
