//
//  ContentView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            VStack(spacing: 20) {
                ColorView(
                    redValue: redValue,
                    greenValue: greenValue,
                    blueValue: blueValue
                )
                VStack {
                    ColorizedView(value: $redValue, color: .red)
                    ColorizedView(value: $greenValue, color: .green)
                    ColorizedView(value: $blueValue, color: .blue)
                }
                .keyboardType(.numberPad)
                .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button {
                            } label: { Image(systemName: "chevron.up") }
                            Button {
                            } label: { Image(systemName: "chevron.down") }
                            
                            Spacer()
                            
                            Button("Done") {
                            }
                        }
                    }
                Spacer()
            }
            .padding()
        }
    }
}

enum Colors {
    case red, green, blue
}

// MARK: - ContentViewPreviews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
