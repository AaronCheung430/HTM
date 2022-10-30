//
//  Concerns.swift
//  HTM
//
//  Created by Aaron Cheung on 30/10/2022.
//

import SwiftUI
import Combine
import AVFoundation

struct Concerns: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    
    var searchBar : some View{
        HStack{
            TextField("Enter in a new task", text: self.$newToDo)
            Button(action: self.addNewToDo, label: {
                Label("Add", systemImage: "plus")
                
            })
        }
    }
    
    func addNewToDo(){
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newToDo))
        let utterance = AVSpeechUtterance(string: newToDo)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
        newToDo = ""
    }
    
    var body: some View {
        NavigationView{
            VStack{
                searchBar.padding()
                List() {
                    ForEach(self.taskStore.tasks){
                        task in
                        Text(task.toDoItem)
                    }
                    .onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                        
                }.navigationTitle("Concerns").navigationBarItems(trailing: EditButton())
            }
        }
    }
    func move(from source : IndexSet, to destination : Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at offsets : IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
}


struct Concerns_Previews: PreviewProvider {
    static var previews: some View {
        Concerns()
    }
}
