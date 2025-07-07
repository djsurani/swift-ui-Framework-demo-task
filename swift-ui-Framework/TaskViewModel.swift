//
//  TaskViewModel.swift
//  swift-ui-Framework
//
//  Created by DhruvSurani on 7/5/25.
//

import SwiftUI

struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
    var category: String
    var isCompleted: Bool = false
    
    init(id: UUID = UUID(), title: String, category: String, isCompleted: Bool = false) {
            self.id = id
            self.title = title
            self.category = category
            self.isCompleted = isCompleted
        }
}
class TaskViewModel: ObservableObject{
    var isCompleted: Bool = false
    @Published var tasks: [Task] = [
        Task(title: "wake up 5AM", category: "Personal"),
        Task(title: "Meditstion for 10 min", category: "Wellness"),
        Task(title: "IOS Developement", category: "work"),
        Task(title: "PERSONAL", category: "Personal"),
        Task(title: "Play VolleyBall", category: "Sport")
    ]
    func addTask(title: String, category: String) {
            let newTask = Task(title: title, category: category)
            tasks.append(newTask)
        }
func toggleTaskCompletion(task: Task) {
    if let index = tasks.firstIndex(where: { $0.id == task.id }) {
        tasks[index].isCompleted.toggle()
    }
}

func removeTask(at offsets: IndexSet) {
    tasks.remove(atOffsets: offsets)
}

    
    private func saveTasks() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "SavedTasks")
        }
    }
    private func loadTasks() {
            if let data = UserDefaults.standard.data(forKey: "SavedTasks"),
               let decoded = try? JSONDecoder().decode([Task].self, from: data) {
                tasks = decoded
            }
        }
    var totalTasks: Int {
        tasks.count
    }

    var completedTasks: Int {
        tasks.filter { $0.isCompleted }.count
    }

    var completionRate: Double {
        totalTasks == 0 ? 0.0 : Double(completedTasks) / Double(totalTasks)
    }

}

