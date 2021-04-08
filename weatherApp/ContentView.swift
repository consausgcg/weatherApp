//
//  ContentView.swift
//  weatherApp
//
//  Created by Austreberto Gomez on 4/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
