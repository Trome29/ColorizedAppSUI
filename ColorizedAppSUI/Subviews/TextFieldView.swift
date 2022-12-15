//
//  TextFieldView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    @Binding var value: Double

    var action: () -> Void
    
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                action()
            }
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
            
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            TextFieldView(text: .constant("0"), value: .constant(0), action: {} )
        }
    }
}
