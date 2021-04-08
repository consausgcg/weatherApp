//
//  ContentView.swift
//  weatherApp
//
//  Created by Austreberto Gomez on 4/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(
                topColor: isNight ? .black : .blue,
                bottomColor: isNight ? .gray : Color("lightBlue")
            )
            
            VStack(spacing: 10) {
                
                CityTextView(cityName: "Edinburg, TX")
                CurrentWeatherStatusView(weatherIcon: "cloud.sun.fill", tempeture: 90)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 76)
                    
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    DefaultButton(text: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
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

struct BackgroundView: View {
    
    var topColor:Color
    var bottomColor:Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct CityTextView:View {
    var cityName:String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherStatusView:View {
    
    var weatherIcon:String
    var tempeture:Int

    var body: some View {
        VStack {
            Image(systemName: weatherIcon).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(tempeture)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


