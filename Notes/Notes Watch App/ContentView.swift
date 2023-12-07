//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Yuvan Shankar on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTY
    
    @AppStorage("lineCount") var lineCount = 1
    @State private var notes = [Note]()
    @State private var text = ""
    
    //MARK: - FUNCTION
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    
    func save() {
       // dump(notes)
        DispatchQueue.main.async {
            do {
                let data = try JSONEncoder().encode(notes)
                let url = getDocumentDirectory().appendingPathComponent("notes")
                try data.write(to: url)
            } catch {
                print("Saving data has failed!")
            }
        }
    }
    
    func load() {
        do {
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            let data = try Data(contentsOf: url)
            
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            print("Failed while load data!")
        }
    }
    
    func delete(offset: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offset)
            save()
        }
    }
    

    //MARK: - BODY

    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6.0) {
                    TextField("Add new note", text: $text)
                    
                    Button(action: {
                        guard text.isEmpty == false else { return }
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        text = ""
                        save()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 43.0, weight: .semibold))
                    })
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accent)
                }
                
                Spacer()
                
                if notes.count > 0 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                                HStack{
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(17)
                }
            }
            .navigationTitle("Notes")
            .onAppear(perform: {
                load()
        })
        }
        .padding(.trailing, 5)
    }
}

#Preview {
    ContentView()
}
