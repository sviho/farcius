//
//  Game.swift
//  Farcius
//
//  Created by Svitlana Honcharuk on 30.01.2021.
//

import SwiftUI

struct Game: View {
    @State var inputTemp = ""
    @State var result = "Try"
    let MAX_INACCURACY = 4 // allowed inaccuracy, in Celsius
    @State var curTemperature = TemperatureGenerator.generateTemperature()
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("\(curTemperature.getFahrenheit())ºF is ")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                TextField("?", text: $inputTemp)
                    .padding([.top, .leading, .bottom])
                    .frame(width: 70.0)
                    .font(.title)
                    .accentColor(.black)
                    .multilineTextAlignment(.trailing)
                Text("ºC")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
            
            Button(action: {
                let celsiusTemp = Int(inputTemp)
                if celsiusTemp != nil {
                    let inaccuracy = celsiusTemp! - curTemperature.getCelsius()
                    if abs(inaccuracy) < MAX_INACCURACY {
                        result = "Great! It's \(curTemperature.getCelsius())ºC"
                    } else {
                        result = "Nope... It's \(curTemperature.getCelsius())ºC"
                    }
                }
            }, label: {
                Text(result)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 50.0)
                    .padding(.vertical)
                    .frame(width: nil)
                    .background(Color.black)
                    .foregroundColor(.white)
            })
                .disabled(result != "Try")
            Spacer()
            
            Button(action: {
                curTemperature = TemperatureGenerator.generateTemperature()
                result = "Try"
                inputTemp = ""
            }, label: {
                Text("Next")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 50.0)
                    .padding(.vertical)
                    .background(Color.black)
                    .foregroundColor(.white)
            })
            Spacer()
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
