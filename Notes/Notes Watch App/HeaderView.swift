//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Yuvan Shankar on 06/12/2023.
//

import SwiftUI

struct HeaderView: View {
    
    var title = ""
    
    var body: some View {
        VStack {
            
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
        }
    }
}

#Preview {
    HeaderView()
}
