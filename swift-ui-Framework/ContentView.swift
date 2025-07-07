import SwiftUI

struct ContentView: View {
    //@ObservedObject var viewModel = TaskViewModel()
    @ObservedObject var viewModel: TaskViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                NavigationLink(destination: StatsView(viewModel: viewModel)) {
                    Text("📊 View Stats")
                }
                .buttonStyle(.bordered)
                .padding(.horizontal)

                addTaskLink
                taskList
            }
            .padding(.top)
            .navigationTitle("📅 Daily Focus")
        }
    }

    // MARK: - Add Task Button
    var addTaskLink: some View {
        NavigationLink(destination: AddTaskView(viewModel: viewModel)) {
            Text("➕ Add Task")
                .font(.headline)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .padding(.horizontal)
    }

    // MARK: - Task List
    var taskList: some View {
        List {
            ForEach(viewModel.tasks) { task in
                TaskPannelView(task: task)
                    .onTapGesture {
                        withAnimation {
                            viewModel.toggleTaskCompletion(task: task)

                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
            .onDelete(perform: viewModel.removeTask)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView(viewModel: TaskViewModel())
}
