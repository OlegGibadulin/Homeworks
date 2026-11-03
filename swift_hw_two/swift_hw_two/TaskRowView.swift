import SwiftUI

struct TaskRowView: View {
    let task: Task

    var body: some View {
        HStack {
            Text(task.category.rawValue)
            Text(task.title)
                .foregroundColor(task.isCompleted ? .gray : .primary)
            Spacer()
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .blue)
        }
    }
}
