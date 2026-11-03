import Foundation

struct TaskItem: Identifiable {
    let id: UUID = .init()
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
}
