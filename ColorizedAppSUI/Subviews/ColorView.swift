//
//  ColorView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
        .cornerRadius(20)
        .frame(height: 150)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 4)
        )
        
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 0, green: 50, blue: 100)
    }
}
