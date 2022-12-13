//
//  TextFieldView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var isAlert = false
    
    var body: some View {
        TextField("", text: $textValue, onCommit: checkRange)
            .frame(width: 45, height: 30)
            .background(.white)
            .cornerRadius(6)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.trailing)
    }
    
    private func checkRange() {
        if (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        isAlert.toggle()
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            TextFieldView(textValue: .constant("0"), value: .constant(0) )
        }
    }
}
