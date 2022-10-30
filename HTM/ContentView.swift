//
//  ContentView.swift
//  HTM
//
//  Created by Aaron Cheung on 30/10/2022.
//

import SwiftUI
import AVFoundation
import Combine

struct ContentView: View {
    
        @Environment(\.openURL) private  var openURL
    
        @State var myList: [String] = []
        @ObservedObject var taskStore = TaskStore()
        var body: some View {
            NavigationView {
                
                VStack {
                                        
                    List{
                        NavigationLink{
                            ColourGradient()
                        } label: {
                            Label("Be Relax", systemImage: "play")
                        }

                        NavigationLink{
                            Concerns()
                        } label: {
                            Label("Thoughts", systemImage: "pencil")
                        }

                        Link(destination: URL(string: "https://www.coolmathgames.com/")!) {
                            Label("Clear up your mind", systemImage: "moon.stars")
                        }

                        Section {
                            Link(destination: URL(string: "https://www.instagram.com/ar/1261760924602676/?ch=NzFmMDA1ODU4Y2RmZjM3MDdlYTMyYzk0OWVmYzQxMjc%3D")!) {
                                Label("Share your joy", systemImage: "square.and.arrow.up")
                            }
                        }
                }

                    
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Joyathon")
                
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
