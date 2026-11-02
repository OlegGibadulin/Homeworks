import SwiftUI

struct TaskListView: View {
    
    @State
    private var taskManager = TaskManager(tasks: [])
    
    var body: some View {
        NavigationStack {
            List(taskManager.tasks) { task in
                TaskRowView(task: task)
                    .contentShape(Rectangle())
                    .onTapGesture{
                        taskManager.toggleTaskCompletion(by: task.id)
                    }
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        let category = TaskCategory.allCases.randomElement()!
                        
                        taskManager.addTask(
                            title: "Новая задача",
                            category: category.rawValue
                        )
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        
    }
}

#Preview {
    TaskListView()
}
