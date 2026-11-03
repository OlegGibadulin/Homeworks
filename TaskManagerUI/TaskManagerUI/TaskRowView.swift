import SwiftUI

struct TaskRowView: View {
    let task: Task

    var body: some View {
        HStack(spacing: 12) {
            Image(
                systemName: task.isCompleted
                    ? "checkmark.circle.fill"
                    : "circle"
            )
            .font(.title2)
            .foregroundStyle(
                task.isCompleted ? Color.green : Color.secondary
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)

                Text(task.category.rawValue)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
    }
}
