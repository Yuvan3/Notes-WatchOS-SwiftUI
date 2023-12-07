//
//  SettingView.swift
//  Notes Watch App
//
//  Created by Yuvan Shankar on 07/12/2023.
//

import SwiftUI

struct SettingView: View {
    
    @AppStorage("lineCount") var lineCount = 1
    @State private var value = 1.0
    
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 18, content: {
            HeaderView(title: "Settings")
            
            Text("LINES: \(lineCount)")
                .fontWeight(.bold)
            
            Slider(value: Binding(get: {
                Double(self.lineCount) as Double
            }, set: { updatedValue in
                value = updatedValue == 1 ? 1 : updatedValue
                update()
            }), in: 0...4, step: 1)
                .accentColor(.accentColor)
        })
    }
}

#Preview {
    SettingView()
}
