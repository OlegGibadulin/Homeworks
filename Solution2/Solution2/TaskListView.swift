import SwiftUI

struct TaskListView: View {
    @State private var manager: TaskManager = TaskManager()

    var body: some View {
        NavigationStack {
            List(manager.tasks) { (task: Task) in
                TaskRowView(task: task)
                    .contentShape(Rectangle())
                    .onTapGesture(perform: { () -> Void in
                        manager.toggleTaskCompletion(by: task.id)
                    })
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                Button(action: { () -> Void in
                    guard let category = TaskCategory.allCases.randomElement()
                    else {
                        return
                    }
                    manager.addTask(title: "Новая задача", category: category)
                }, label: { () -> Image in
                    return Image(systemName: "plus")
                })
            }
        }
    }
}

#Preview {
    TaskListView()
}
