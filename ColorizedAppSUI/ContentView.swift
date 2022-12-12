//
//  ContentView.swift
//  ColorizedAppSUI
//
//  Created by Roman on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = ""
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 200)
                    .foregroundColor(.red)
                VStack(spacing: 20) {
                    HStack {
                        Text("Red")
                            .foregroundColor(.white)
                            .frame(width: 50)
                        Slider(value: .constant(0.5))
                        TextField("", text: $redValue)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 50)
                    }
                    HStack {
                        Text("Green")
                            .foregroundColor(.white)
                            .frame(width: 50)
                        Slider(value: .constant(0.5))
                        TextField("", text: $redValue)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 50)
                    }
                    HStack {
                        Text("Blue")
                            .foregroundColor(.white)
                            .frame(width: 50)
                        Slider(value: .constant(0.5))
                        TextField("", text: $redValue)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 50)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
