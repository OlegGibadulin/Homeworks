import SwiftUI

struct ContentView: View {
    let tasks: [Task] = [
        Task(
            id: UUID(),
            title: "Закончить проект",
            category: .work,
        ),
        Task(
            id: UUID(),
            title: "Выучить SwiftUI",
            category: .study,
        )
    ]
    
    var body: some View {
        List(tasks) { task in
            TaskRowView(task: task)
        }
    }
}

#Preview {
    ContentView()
}
