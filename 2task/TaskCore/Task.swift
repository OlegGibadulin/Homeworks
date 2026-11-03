import Foundation

struct Task: Identifiable{
    let id : UUID = UUID()
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
}

