import SwiftUI

@main
struct ru_taskmanagerApp: App {
    @State
    private var taskManager: TaskManager = {
        let manager = TaskManager()
        manager.addTask(title: "Первая задача", category: .personal)
        manager.addTask(title: "Вторая задача", category: .study)
        manager.addTask(title: "Третья задача", category: .work)
        manager.addTask(
            title: "Очень очень очень очень очень очень длинная длинная длинная длинная длинная задача",
            category: .work
        )
        return manager
    }()

    var body: some Scene {
        WindowGroup {
            TaskListView(taskManager: taskManager)
        }
    }
}
