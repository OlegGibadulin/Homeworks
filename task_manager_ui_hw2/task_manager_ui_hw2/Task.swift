import Foundation

enum TaskCategory: String {
    case work = "работа💼"
    case study = "учеба📚"
    case personal = "личное🧸"
}

struct Task: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
}
