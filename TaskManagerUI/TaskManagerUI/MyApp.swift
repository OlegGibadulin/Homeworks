import SwiftUI

@main
struct MyApp: App {
    @State private var manager = TaskManager(
        initialTasks: [
            Task(title: "Изучить SwiftUI", category: .study),
            Task(title: "Сделать домашнее задание", category: .work),
            Task(
                title: "Повторить лекцию",
                isCompleted: true,
                category: .study
            ),
            Task(title: "Отдохнуть", category: .personal)
        ]
    )

    var body: some Scene {
        WindowGroup {
            TaskListView(manager: manager)
        }
    }
}

#Preview {
    TaskListView(
        manager: TaskManager(
            initialTasks: [
                Task(title: "Изучить SwiftUI", category: .study),
                Task(title: "Сделать домашнее задание", category: .work)
            ]
        )
    )
}
