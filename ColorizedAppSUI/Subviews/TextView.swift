//
//  TextView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct TextView: View {
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .foregroundColor(.white)
            .frame(width: 35, alignment: .leading)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            TextView(value: 1)
        }
    }
}
