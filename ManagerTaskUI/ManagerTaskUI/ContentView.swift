//
//  ContentView.swift
//  ManagerTaskUI
//
//  Created by Ivan Petrischev on 02.11.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "person")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .background(Color.black)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
