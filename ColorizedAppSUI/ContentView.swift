//
//  ContentView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = Double(Int.random(in: 0...255))
    @State private var greenValue = Double(Int.random(in: 0...255))
    @State private var blueValue = Double(Int.random(in: 0...255))
    //@State private var isUpDown = false
    
    //@FocusState var isInputActive: NameColor?
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            VStack(spacing: 20) {
                RectangleView(
                    redValue: $redValue,
                    greenValue: $greenValue,
                    blueValue: $blueValue
                )
                ColorView(value: $redValue)
                ColorView(value: $greenValue)
                ColorView(value: $blueValue)
                
                Spacer()
                
            }
            .padding()
        }
    }
}
//
//enum NameColor {
//    case red, green, blue
//}

struct RectangleView: View {
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 350, height: 200)
            .foregroundColor(Color(
                red: redValue / 255,
                green: greenValue / 255,
                blue: blueValue / 255
            ))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 4)
            )
    }
}

struct ColorView: View {
    @Binding var value: Double
    
    var body: some View {
        HStack {
            TextView(value: $value)
            SliderView(value: $value)
            TextfieldView(value: $value)
        }
    }
}

struct TextView: View {
    @Binding var value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .foregroundColor(.white)
            .frame(width: 35, alignment: .leading)
    }
}

struct SliderView: View {
    @Binding var value: Double
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1)
            .tint(.gray)
    }
}

struct TextfieldView: View {
    @Binding var value: Double
    
    var body: some View {
        TextField("", value: $value, format: .number)
            .frame(width: 45, height: 30)
            .background(.white)
            .cornerRadius(6)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.trailing)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
