//
//  ContentView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    @State private var isUpDown = false
    
    @FocusState var isInputActive: NameColor?
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 200)
                    .foregroundColor(Color(
                        red: redSliderValue / 255,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255
                    ))
                ColorView(value: $redSliderValue, text: "\(lround(redSliderValue))")
                ColorView(value: $greenSliderValue, text: "\(lround(greenSliderValue))")
                ColorView(value: $blueSliderValue, text: "\(lround(blueSliderValue))")
                
                Spacer()
            }
            .padding()
        }
    }
}

enum NameColor {
    case red, green, blue
}

struct ColorView: View {
    @Binding var value: Double
    let text: String
    
    var body: some View {
        HStack {
            LabelView(value: $value)
            SliderView(value: $value)
            TextfieldView(value: $value, text: text)
        }
    }
}

struct TextfieldView: View {
    @Binding var value: Double
    let text: String
    
    var body: some View {
        TextField(text, value: $value, format: .number)
            .frame(width: 50, height: 30)
            .background(.white)
            .cornerRadius(6)
            .textFieldStyle(.roundedBorder)
    }
}

struct LabelView: View {
    @Binding var value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .foregroundColor(.white)
            .frame(width: 50)
    }
}

struct SliderView: View {
    @Binding var value: Double
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
