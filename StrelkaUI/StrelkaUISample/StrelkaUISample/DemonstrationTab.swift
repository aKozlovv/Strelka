//
//  ContentView.swift
//  StrelkaUISample
//
//  Created by Антон Козлов on 21.03.2025.
//

import SwiftUI
import StrelkaUI

struct ContentView: View {
    var body: some View {
        TabView {
            TypograpghyView()
                .tag(0)
                .tabItem {
                    Label("Текст", systemImage: "text.alignright")
                }
            
            ColorsView()
                .tag(1)
                .tabItem {
                    Label("Цвета", systemImage: "paintbrush.fill")
                }
            
            ButtonsView()
                .tag(2)
                .tabItem {
                    Label("Кнопки", systemImage: "rectangle.3.offgrid")
                }
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
