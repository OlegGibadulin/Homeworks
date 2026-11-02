import SwiftUI

struct TaskRowView: View {
    var task: Task
    var body: some View {
        HStack(spacing: 12) {
            Text(task.category.rawValue)
                
            Text(task.title)
            Spacer()
            
            Image(systemName: task.isCompleted
                  ? "checkmark.circle.fill"
                  : "circle")
            .foregroundStyle(task.isCompleted ? .green : .gray)
        }
        .padding()
    }
}

#Preview {
    var Task = Task(
        id: UUID.init(),
        title: "Уничтожить бумагу",
        category: TaskCategory(rawValue: "💼Работа") ?? .other)
    TaskRowView(task: Task)
}
