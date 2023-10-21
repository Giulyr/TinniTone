////
////  NoiseConductorModel.swift
////  tinnitool
////
////  Created by Marcelo Esposito on 15/02/22.
////
//
//
////MARK: - TO BE DISCARDED!!
//
//
//import AudioKit
//import SoundpipeAudioKit
//import AudioKitEX
//import SwiftUI
//
//
////enum NoiseType: Identifiable {
////      case white, pink, brown
////      var id: Self { self }
////  }
////
////class NoisePlayerConductor: ObservableObject {
////    
////    var white = WhiteNoise()
////    var pink = PinkNoise()
////    var brown = BrownianNoise()
////    var mixer = Mixer()
////    let engine = AudioEngine()
////    
////    @Published var selectedNoiseType: NoiseType = .white
////    
////    
////    func changeNoise()->Node {
////        var currentNoise : Node = WhiteNoise()
////        
////        switch selectedNoiseType {
////        case .white:
////            currentNoise = WhiteNoise()
////        case .pink:
////            currentNoise = PinkNoise()
////        case .brown:
////            currentNoise = BrownianNoise()
////        }
////        return currentNoise
////        
////    }
////   
////    
////    @Published var volume: AUValue = 0.0 {
////        didSet {
////            white.amplitude = self.volume
////        }
////    }
////    
////    
////    @Published var isPlaying: Bool = false {
////        didSet {
////            isPlaying ? white.start() : white.stop()
////        }
////    }
////    
////    init() {
////        mixer.addInput(white)
////        engine.output = mixer
////    }
////    
////    func engineStart() {
////        white.amplitude = self.volume
////        do {
////            try engine.start()
////        } catch {
////            Log("Engine couldn't start")
////        }
////    }
////    
////    func engineStop() {
////        engine.stop()
////    }
////}
//
//
////MARK: - testing view, to remove before final version
//
//struct NoiseConductorView: View {
//    @StateObject var conductor = NoisePlayerConductor ()
//    
//    var body: some View {
//        VStack{
//            Spacer()
//            
//            Button {
//                $conductor.isPlaying.toggle()
//            } label: {
//              (  !conductor.isPlaying ? Image(systemName: "play.fill").font(.system(size: 70)) : Image(systemName: "pause.fill").font(.system(size: 70)) )
//            }
//            
//            Spacer()
//            
//            HStack{
//                Spacer()
//                Text("Selected noise:")
//                
//                Spacer()
//                
//                Picker(selection: self.$conductor.selectedNoiseType) {
//                    Text("White Noise").tag(NoiseType.white)
//                    Text("Pink Noise").tag(NoiseType.pink)
//                    Text("Brown Noise").tag(NoiseType.brown)
//                } label: {
//                    Text("select noise")
//                }
//
//                Spacer()
//            }
//            
//            Spacer()
//            
//            Slider(value: self.$conductor.volume, in: 0...1).padding()
//            
//            Spacer()
//        }.onAppear(perform: self.conductor.engineStart)
//            .onDisappear(perform: self.conductor.engineStop)
//    }
//}
//
//struct NoiseConductorView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoiseConductorView()
//            .preferredColorScheme(.light)
//        NoiseConductorView()
//            .preferredColorScheme(.dark)
//    }
//}
