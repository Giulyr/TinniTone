//
//  JamSessionView.swift
//  tinnitool
//
//  Created by Elio Barisani on 18/02/22.
//

import SwiftUI
import AudioToolbox

struct JamSessionView: View {

    @StateObject var conductor = NoiseConductor()
    
    @EnvironmentObject var logsCont : LogsContainer
    
    @State var isEnabled : Bool = false
//    {
//        didSet{
//            isShowing.toggle()
//            print(isShowing)
//        }
//    }

    @State var isShowing : Bool = false
    
    var body: some View {
        
        
            
        VStack(alignment: .leading){
                Text("Trattamento")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                
                Form{
                
                    VStack{
                    
//********************* NOISE SELECTOR *****************
                    
                        HStack{

                    Text("Seleziona il rumore:")
                    
                    
                    Picker(selection: self.$conductor.selectedNoiseType) {
                        
                        Text("Rumore Bianco").tag(NoiseType.white)
                        Text("Rumore Rosa").tag(NoiseType.pink)
                        Text("Rumore Marrone").tag(NoiseType.brown)
                        
                    } label: {
                    }.pickerStyle(.menu)
                                
                }
            }

                
//*************** VOLUME SLIDER ************************
                
                Slider(value: self.$conductor.volume, in: 0...1)
                        .disabled(!isEnabled)
                    
                    Toggle("Cambia il volume", isOn: $isEnabled).onChange(of: isEnabled) { newValue in
                        if isEnabled {isShowing = true} else {isShowing = false}                    }
                    

                    
        //in teoria quando abilito lo slider mi esce l'alert che avverte di non cambiare il valore dello slider
                    
//                        .alert("Volume Alert", isPresented: $isShowing) {
//                            Button("Revert change", role: .cancel) {
//                               isEnabled = false
//                            }
//
//                            Button("Confirm") {
//                                isEnabled = true
//                            }
//                        }
                    
                        .alert("Allerta volume", isPresented: $isShowing) {
                            Button("Cancella", role: .cancel) {
                               isEnabled = false
                            }

                            Button("Conferma") {
                                isEnabled = true
                            }
                        } message: {
                            Text("La modifica del volume dei suoni potrebbe influire negativamente sulla terapia")
                        }

                    
                    

//****************** PLAY/PAUSE BUTTON *****************
            
                Section{
                    
                    HStack{
                        
                        Spacer()

                        Group{
                            
                            (!conductor.isPlaying ? Image(systemName: "play.circle.fill").font(.system(size: 119))
                         : Image(systemName: "pause.circle.fill").font(.system(size: 119)))
                                .onTapGesture {
                            conductor.isPlaying.toggle()
                                    if conductor.isPlaying {
                                        logsCont.playPressed()
                                    }else{
                                        logsCont.pausePressed()
                                    }
                                    
                                    
                                }
                                .foregroundColor(.yellow)
                            
                            }.padding(.vertical, 20.0)
                Spacer()
                        
                    }
                }
                
//****************** DEVICE SELECTION PICKER ***********
//                to complete backend implementation
                
//                Section{
//
//                    HStack{
//
//                    Spacer()
//
//                    Label {
//                        Text("Selected Device")
//                    } icon: {
//                        Image(systemName: "airplayaudio")
//                    }.font(.body)
//                     .foregroundColor(.yellow)
//
//                Spacer()
//
//                    }
//                }
//
// ********************** DATALOGGING TESTING VIEW *********************
//                    to comment and remove from the final product
                    
//                    Section {
//                        TestingView()
//                    }header: {
//                        Text("Testing view")
//                    }
                
              
            }.listStyle(.insetGrouped)
            }.onAppear{
                self.conductor.start()
            }
        .navigationTitle("Treatment")
            .navigationBarBackButtonHidden(true)
//        }
    }
}





struct JamSessionView_Previews: PreviewProvider {
    static var previews: some View {
        JamSessionView()
            .environmentObject(LogsContainer())
            .preferredColorScheme(.light)
        JamSessionView()
            .environmentObject(LogsContainer())
            .preferredColorScheme(.dark)
        

    }
}
