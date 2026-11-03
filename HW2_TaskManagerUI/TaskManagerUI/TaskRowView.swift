import SwiftUI

struct TaskRowView: View {
    let task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)

            Text(task.title).foregroundColor(task.isCompleted ? .gray : .primary)

            Spacer()


            Text(task.category.rawValue)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    List {
        TaskRowView(task: Task(title: "Невыполненная", category: .work))
        TaskRowView(task: Task(title: "Выполненная", isCompleted: true, category: .study))
    }
}
