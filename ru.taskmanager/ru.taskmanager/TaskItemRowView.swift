import SwiftUI

struct TaskItemRowView: View {
    let task: TaskItem

    var body: some View {
        HStack {
            Image(systemName: task.category.iconName)
                .frame(width: 30)
            Text(task.title)
            Spacer()
            Image(systemName: statusIcon)
                .foregroundStyle(statusColor)
        }
        .contentShape(Rectangle())
    }

    private var statusColor: Color {
        task.isCompleted ? .green : .blue
    }

    private var statusIcon: String {
        task.isCompleted ? "checkmark.circle.fill" : "circle"
    }
}

#Preview {
    TaskItemRowView(task: TaskItem(title: "Новая задача", isCompleted: true, category: .personal))
}
