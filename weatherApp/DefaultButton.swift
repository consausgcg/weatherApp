//
//  DefaultButton.swift
//  weatherApp
//
//  Created by Austreberto Gomez on 4/8/21.
//
import SwiftUI

struct DefaultButton:View {
    
    var text:String
    var textColor:Color
    var backgroundColor:Color
    
    var body: some View {
        Text(text)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
