//
//  ContentView.swift
//  NoteApp2
//
//  Created by Nadia Hansen on 18/09/2020.
//  Copyright © 2020 Nadia Hansen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var repo = Repo() // 2-way binding
    var body: some View {
        NavigationView{
            VStack {
                Button(action: {
                    //self.repo.notes.append(Note(title: "x"))
                    self.repo.addNote(note: Note(title: "start", id: UUID()))
                    print("btn press")
                }){
                    Text("Add Note")
                }
                List{
                    ForEach(self.repo.notes){ note in
                        NavigationLink(destination: DetailView(text: note.title, repo: self.repo, currentNote: note, image: note.image)){
                            Text(note.title)
                            // vis denne note i DetailView
                        }
                    }
                }
            }.onAppear(){
//                print("onappear")
//                self.repo.notes.append(Note(title: "", )) // tilføj
//                self.repo.notes.remove(at: self.repo.notes.count-1) // slet
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

