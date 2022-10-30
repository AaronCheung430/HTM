//
//  DataStore.swift
//  HTM
//
//  Created by Aaron Cheung on 30/10/2022.
//

import SwiftUI
import Foundation
import Combine

struct Task : Identifiable {
    var id = String()
    var toDoItem = String()
    
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}
