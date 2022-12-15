//
//  ContentView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    
    @FocusState var isInputActive: Bool
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
                .onTapGesture {
                    isInputActive = false
                }
            VStack(spacing: 20) {
                ColorView(
                    redValue: red,
                    greenValue: green,
                    blueValue: blue
                )
                VStack {
                    ColorSliderView(value: $red, color: .red)
                    ColorSliderView(value: $green, color: .green)
                    ColorSliderView(value: $blue, color: .blue)
                }
                .frame(height: 150)
                .focused($isInputActive)
                .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            //Spacer()
                            Button {
                                isInputActive = false
                                
                            } label: { Image(systemName: "chevron.up") }
                            Button {
                                isInputActive = true
                                
                            } label: { Image(systemName: "chevron.down") }
                            Spacer()
                            Button("Done") {
                                isInputActive = false
                            }
                        }
                    }
                Spacer()
            }
            .padding()
        }
    }
    
}

// MARK: - ContentViewPreviews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
