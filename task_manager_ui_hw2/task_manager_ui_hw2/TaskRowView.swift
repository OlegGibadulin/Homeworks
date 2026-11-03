import SwiftUI

struct TaskRowView: View {
    var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .blue)

            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .strikethrough(task.isCompleted)
                Text(task.category.rawValue)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}
