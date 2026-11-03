import Foundation

// Категории задач

enum TaskCategory: String, CaseIterable {
    case work = "💼 Работа"
    case study = "📚 Учёба"
    case personal = "🏠 Личное"

    // Иконка категории, взятая из RawValue: "💼 Работа" -> "💼"
    var icon: String {
        String(rawValue.prefix(1))
    }
}

// Модель задачи

struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
}
