import Foundation

struct Task : Identifiable {
    let id: UUID
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
    
}
