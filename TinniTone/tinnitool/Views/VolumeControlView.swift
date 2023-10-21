//
//  VolumeControlView.swift
//  tinnitool
//
//  Created by Marcelo Esposito on 17/02/22.
//

import SwiftUI

struct taccaMisura: View{
    @State var isIt : Bool = false
    
    var heightY : CGFloat {
        isIt ? 300 : 150
   }
    
    @State var opacityControl : CGFloat = 1
    
    
    var body: some View {
        VStack{
            Spacer()
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 150, height: heightY).foregroundColor(Color(UIColor.systemGray6))
              
            
            RoundedRectangle(cornerRadius: 15).frame(width: 150, height: heightY).foregroundColor(Color.green.opacity(opacityControl))
               
        }.onTapGesture {
            isIt.toggle()
        }
            
            Slider(value: $opacityControl, in: 0...1).padding()
            Spacer()
        }
        
        }
}


struct VolumeControlView: View {
    var body: some View {
   Text("Hello World!")
    }
}

struct VolumeControlView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeControlView()
        taccaMisura()
    }
}
