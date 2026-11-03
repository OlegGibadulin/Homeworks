import Foundation


enum TaskCategory: String, CaseIterable {
    case work = "💼 Работа"
    case study = "📚 Учёба"
    case personal = "🏠 Личное"
}


struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted = false
    var category: TaskCategory
}
