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
    
    @FocusState var isEnter: Bool
    @FocusState var color: Colors?
    
    @State private var alertPresented = false
    @State private var isMove = false
    
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
                        .focused($color, equals: .red)
                    ColorizedView(value: $greenValue, color: .green)
                        .focused($color, equals: .green)
                    ColorizedView(value: $blueValue, color: .blue)
                        .focused($color, equals: .blue)
                }
                .focused($isEnter)
                .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button {
                                isMove = false
                                check()
                            } label: { Image(systemName: "chevron.up") }
                            Button {
                                isMove = true
                                check()
                            } label: { Image(systemName: "chevron.down") }
                            
                            Spacer()
                            
                            Button("Done") {
                                isEnter = false
                            }
                        }
                    }
                Spacer()
            }
            .padding()
        }
    }
    
    private func check() {
        switch (color, isMove) {
        case (.red, isMove):
            color = isMove ? .green : .blue
        case (.green, isMove):
            color = isMove ? .blue : .red
        default:
            color = isMove ? .red : .green
        }
    }
}

// MARK: - ContentViewPreviews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Colors {
    case red, green, blue
}
