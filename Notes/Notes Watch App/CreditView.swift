//
//  CreditView.swift
//  Notes Watch App
//
//  Created by Yuvan Shankar on 06/12/2023.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack(spacing: 3, content: {
            
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .layoutPriority(1)
            
            HeaderView(title: "Credits")
            
            Text("Yuvan")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
            
        })
        
    }
}

#Preview {
    CreditView()
}
