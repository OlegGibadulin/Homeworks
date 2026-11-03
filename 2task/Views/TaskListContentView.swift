import SwiftUI
struct TaskListContentView: View{
    var manager: TaskManager
    var body: some View{
        VStack(alignment: .leading){
            if !manager.tasks.isEmpty{
                ForEach(manager.tasks) { task in
                    TaskRowView(task: task)
                        .onTapGesture {
                            manager.toggleTaskCompletion(task.id)
                        }
                }
                Spacer()
            }
        }
    }
}
