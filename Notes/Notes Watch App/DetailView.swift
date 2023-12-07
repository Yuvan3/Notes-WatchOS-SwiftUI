//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Yuvan Shankar on 06/12/2023.
//

import SwiftUI

struct DetailView: View {
    
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented = false
    @State private var isSettingsPresented = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3.0) {
         
            HeaderView()
            
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            HStack(alignment: .center, content: {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented, content: {
                        SettingView()
                    })
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditView()
                    })
                
            })
            .foregroundColor(.secondary)
        }
        .padding(3)
    }
}

#Preview {
    let sampleData = Note(id: UUID(), text: "Hello WatchOS!")
    return DetailView(note: sampleData, count: 5, index: 1)
}
