//
//  ContentView.swift
//  weatherApp
//
//  Created by Austreberto Gomez on 4/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var cityString:String = ""
    @State var cityTempeture:Double = 0
    @State private var isNight = false
    @State private var initialSearch = false
    @State var data = WeatherData(
        city: CityData(name: "Edinburg, US"),
        list: [
            DayWeatherData(main: TempetureData(temp: 3)),
            DayWeatherData(main: TempetureData(temp: 3)),
            DayWeatherData(main: TempetureData(temp: 3)),
            DayWeatherData(main: TempetureData(temp: 3)),
            DayWeatherData(main: TempetureData(temp: 3))
       ]
    )
    
    
    func getWeather(){
        
        self.initialSearch = true
        
        let urlString:String = "https://api.openweathermap.org/data/2.5/forecast?q=\(self.cityString.replacingOccurrences(of: " ", with: "")),US&appid=f0a0d54cf7d91405eac6eb8676888906&cnt=5&units=metric"
        
            let url = URL(string: urlString)
        
        print(urlString)
            
            URLSession.shared.dataTask(with: url!) {
                data, _, error in
                
                DispatchQueue.main.async {
                    
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(WeatherData.self, from: data)
                            self.data = decodedData
                            self.cityString = self.data.city.name
                            self.cityTempeture = self.data.list[0].main.temp
                        } catch {
                            print("Error!")
                        }
                    }
                
                }
            }.resume()
        }
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            
            VStack(spacing: 10) {
                
                
                initialSearch ? Group{
                    
                    Spacer()
                    
                    Button{
                        isNight.toggle()
                    } label: {
                        DefaultButton(text: "Change Day Time",
                                      textColor: .blue,
                                      backgroundColor: .white)
                    }
                    
                    CityTextView(cityName: cityString)
                    CurrentWeatherStatusView(
                        weatherIcon: isNight ?
                            "moon.stars.fill" : "cloud.sun.fill",
                        tempeture: Int(cityTempeture))
                    
                    HStack(spacing: 20){
                        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: Int(self.data.list[0].main.temp))
                        
                        WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: Int(self.data.list[1].main.temp))
                        
                        WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: Int(self.data.list[2].main.temp))
                        
                        WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: Int(self.data.list[3].main.temp))
                        
                        WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: Int(self.data.list[4].main.temp))
                        
                    }
                    
                    Spacer()
                } : nil
                
                VStack {
                    TextField("Enter city name", text: $cityString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button{
                        self.getWeather()
                    } label: {
                        DefaultButton(text: "Lookup",
                                      textColor: .blue,
                                      backgroundColor: .white)
                    }
                }
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
    
    @Binding var isNight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(
                        colors: [
                            isNight ? .black : .blue,
                            isNight ? .gray : Color("lightBlue")]),
            startPoint: .topLeading, endPoint: .bottomTrailing
        )
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


