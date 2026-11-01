
import Foundation
//
//1. Модели данных
// Создайте enum TaskCategory. Он должен описывать категорию задачи (например, .work, .study, .personal). Задайте ему String в качестве RawValue (например, строковое значение с эмодзи: "💼 Работа").
// Создайте struct Task и обязательно подпишите её под протокол Identifiable (это понадобится нам в следующем ДЗ для верстки).
// Внутри Task должны быть свойства:
//id (тип UUID, генерируется автоматически по умолчанию).
//title (тип String — название задачи).
//isCompleted (тип Bool — статус выполнения, по умолчанию false).
//category (тип TaskCategory).
enum TaskCategory:String{
    case work="работа"
    case study="учеба"
    case personal="мое"
}
struct Task:Identifiable{
    let id: UUID=UUID()
    var title: String

    var isCompleted :Bool=false

    var category:TaskCategory
}
//2. Менеджер задач
// Создайте класс TaskManager. Он должен содержать внутри себя приватный массив задач [Task].
// Реализуйте метод addTask(title:category:), который создает новую задачу и добавляет её в массив.
// Реализуйте метод removeTask(by id: UUID), который находит задачу по id и удаляет её из массива.
// Реализуйте метод toggleTaskCompletion(by id: UUID).
//Подсказка: так как Task — структура, вы не можете просто поменять её копию. Вам нужно найти индекс задачи в массиве через firstIndex(where:) и изменить её напрямую: tasks[index].isCompleted.toggle().
// Реализуйте метод filterTasks(by category: TaskCategory) -> [Task]. Он должен возвращать массив только невыполненных задач указанной категории, используя функцию высшего порядка .filter.
class TaskManager {
    private var tasks: [Task] = []

    func addTask(title: String, category: TaskCategory) {
        let newTask = Task(title: title, category: category)
        tasks.append(newTask)
    }
    func removeTask(by id: UUID) {
        for index in tasks.indices {
            if tasks[index].id == id {
                tasks.remove(at: index)
                break
            }
        }
    }
    func toggleTaskCompletion(by id: UUID) {
        if let index = tasks.firstIndex(where: { task in
            task.id == id
        }) {
            tasks[index].isCompleted.toggle()
        }
    }
    func filterTasks(by category: TaskCategory) -> [Task] {
        return tasks.filter { task in
            task.category == category && task.isCompleted == false
        }
    }

}


let manager = TaskManager()

manager.addTask(title: "Сделать отчёт", category: .work)
manager.addTask(title: "Ответить на письма", category: .work)
manager.addTask(title: "Подготовиться к матану", category: .study)
manager.addTask(title: "Сходить в зал", category: .personal)


print("Невыполненные задачи по работе (до):")
for task in manager.filterTasks(by: .work) {
    print("\(task.title)")
}


let workTasks = manager.filterTasks(by: .work)
if let firstWorkTask = workTasks.first {
    manager.toggleTaskCompletion(by: firstWorkTask.id)
}


print("Невыполненные задачи по работе (после):")
for task in manager.filterTasks(by: .work) {
    print("\(task.title)")
}
