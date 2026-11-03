import SwiftUI

struct TaskRowView: View {
    let task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
            Text(task.title)
            Spacer()
            Text(task.category.rawValue)
        }
    }
}

#Preview {
    VStack {
        TaskRowView(task: Task(title: "Сделать ДЗ", category: .study))
        TaskRowView(task: Task(title: "Отправить отчёт", isCompleted: true, category: .work))
    }
}
