import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @State private var title: String = ""
    @State private var category: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Task Title")) {
                    TextField("e.g. Build UI", text: $title)
                }

                Section(header: Text("Category")) {
                    TextField("e.g. Work", text: $category)
                }

                Button("Save Task") {
                    viewModel.addTask(title: title, category: category)
                    dismiss()
                }
                .disabled(title.isEmpty || category.isEmpty)
            }
            .navigationTitle("➕ Add Task")
        }
    }
}
