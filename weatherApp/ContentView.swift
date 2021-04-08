//
//  ContentView.swift
//  weatherApp
//
//  Created by Austreberto Gomez on 4/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            VStack(spacing: 10) {
                Text("Edinburg, TX")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack{
                    Image(systemName: "cloud.sun.fill").renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 76)
                    
                }
                
                Spacer()
                
                Button{
                    print("click")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek:String
    var imageName:String
    var temperature:Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
