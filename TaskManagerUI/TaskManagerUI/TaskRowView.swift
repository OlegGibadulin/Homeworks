import SwiftUI

// Ячейка одной задачи

struct TaskRowView: View {
    let task: Task
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            // Слева — большой значок категории
            Text(task.category.icon)
                .font(.system(size: 40))
                .frame(width: 56)

            // Справа: сверху название, снизу чекбокс
            VStack(alignment: .leading, spacing: 8) {
                Text(task.title)
                    .font(.headline)
                    .foregroundStyle(task.isCompleted ? Color.secondary : Color.primary)

                HStack(spacing: 6) {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(task.isCompleted ? Color.green : Color.blue)

                    Text(task.isCompleted ? "Выполнено" : "Не выполнено")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()
        }
        .padding(.vertical, 6)
        .contentShape(Rectangle())
        .onTapGesture(perform: onToggle)
    }
}

#Preview {
    List {
        TaskRowView(task: Task(title: "Сделать ДЗ по матстатистике", category: .study)) {}
        TaskRowView(task: Task(title: "Помыть посуду", isCompleted: true, category: .personal)) {}
    }
}
