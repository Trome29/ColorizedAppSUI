//
//  ColorizedView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct ColorizedView: View {
    @Binding var value: Double
    @State var textValue = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            TextView(value: value)
            SliderView(value: $value)
                .onChange(of: value) { _ in
                    textValue = "\(lround(value))"
                }
            TextFieldView(textValue: $textValue, value: $value)
        }
        .onAppear {
            textValue = "\(lround(value))"
        }
    }
}

struct ColorizedView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            ColorizedView(value: .constant(100), color: .red)
        }
    }
}
