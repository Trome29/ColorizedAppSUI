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
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }
            VStack(spacing: 20) {
                ColorView(red: red, green: green, blue: blue)
                VStack {
                    ColorSliderView(value: $red, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $green, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $blue, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .frame(height: 150)
                .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button(action: previousField) {
                                Image(systemName: "chevron.up")
                            }
                            Button(action: nextField) {
                                Image(systemName: "chevron.down")
                            }
                            Spacer()
                            Button("Done") {
                                focusedField = nil
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

extension ContentView {
    private enum Field {
        case red, green, blue
    }
    
    private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    
    private func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}
