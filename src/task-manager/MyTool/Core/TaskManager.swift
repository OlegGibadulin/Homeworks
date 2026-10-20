import Foundation

final class TaskManager {
    private var tasks: [TaskItem] = []

    /// Добавить задачу.
    /// - Parameters:
    ///   - title: Наименование задачи.
    ///   - category: Описание задачи.
    func addTask(title: String, category: TaskCategory) {
        tasks.append(TaskItem(title: title, category: category))
    }

    /// Удалить задачу по идентификатору.
    /// - Parameter id: Идентификатор задачи.
    /// - Throws: TaskManagerError.elementNotFound, если задача не найдена.
    func removeTask(by id: UUID) throws {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            throw TaskManagerError.elementNotFound
        }

        tasks.remove(at: index)
    }

    /// Пометить задачу как выполненную.
    /// - Parameter id: идентификатор задачи.
    /// - Throws: TaskManagerError.elementNotFound, если задача не найдена.
    func toggleTaskCompletion(by id: UUID) throws {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            throw TaskManagerError.elementNotFound
        }

        tasks[index].isCompleted.toggle()
    }

    /// Получить невыполненные задачи с фильтром по категории.
    /// - Parameter category: целевая категория
    /// - Returns: Невыполненные задачи указанной категории.
    func filterTasks(by category: TaskCategory) -> [TaskItem] {
        tasks.filter { $0.category == category && !$0.isCompleted }
    }
}
