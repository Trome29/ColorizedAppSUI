//
//  ColorizedView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var text = ""
    @State private var showAlert = false
    
    let color: Color
    
    var body: some View {
        HStack {
            Text(value.formatted())
                .foregroundColor(.white)
                .frame(width: 35, alignment: .leading)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { text = $0.formatted() }
            
            TextFieldView(text: $text, value: $value, action: checkValue)
                .alert("Wrong format!", isPresented: $showAlert, actions: {}) {
                    Text("Please enter value from 0 to 255")
                }
        }
        .onAppear {
            text = value.formatted()
        }
    }
    
    private func checkValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        text = "0"
    }
}

struct ColorizedView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            ColorSliderView(value: .constant(100), color: .red)
        }
    }
}
