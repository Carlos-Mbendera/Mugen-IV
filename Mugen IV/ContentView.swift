//
//  ContentView.swift
//  Mugen IV
//
//  Created by Carlos Mbendera on 03/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello There!")
                .padding()
            
            Button("Play something"){
                playMiDi()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
