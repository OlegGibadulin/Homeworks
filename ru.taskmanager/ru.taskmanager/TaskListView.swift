import SwiftUI

struct TaskListView: View {
    var taskManager: TaskManager

    private var tasks: [TaskItem] {
        taskManager.getTasks()
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    TaskItemRowView(task: task)
                        .onTapGesture { toggle(task) }
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: addRandomTask) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    private func toggle(_ task: TaskItem) {
        do {
            try taskManager.toggleTaskCompletion(by: task.id)
        } catch {
            print("Error while toggle: \(error)")
        }
    }

    private func deleteTasks(at offsets: IndexSet) {
        for index in offsets {
            do {
                try taskManager.removeTask(by: tasks[index].id)
            } catch {
                print("Error while removing task: \(error)")
            }
        }
    }

    private func addRandomTask() {
        taskManager.addTask(
            title: "Новая задача",
            category: .allCases.randomElement() ?? .personal
        )
    }
}

#Preview {
    let taskManager: TaskManager = {
        let manager = TaskManager()
        manager.addTask(title: "taskOne", category: .personal)
        return manager
    }()

    TaskListView(taskManager: taskManager)
}
