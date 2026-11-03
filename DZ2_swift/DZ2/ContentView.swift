import SwiftUI

enum TaskCategory: String, CaseIterable {
    case cardio = "🏃‍♀️"
    case strength = "💪"
    case street = "🌳"
}

struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var category: TaskCategory
}

@Observable
class TaskManager {
    private(set) var tasks: [Task]
    
    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
    
    func addTask(title: String, category: TaskCategory) {
        let newTask = Task(title: title, category: category)
        tasks.append(newTask)
        print("добавлена задача \(newTask.title) в категорию \(newTask.category.rawValue)")
    }
    
    func removeTask(by id: UUID) {
        tasks.removeAll { $0.id == id }
    }
    
    func toggleTaskCompletion(by id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
            let status: String
            if tasks[index].isCompleted {
                status = "выполнено"
            } else {
                status = "невыполнено"
            }
            print("статус задачи \"\(tasks[index].title)\" изменен на \(status)")
        } else {
            print("задача с таким id не найдена")
        }
    }
    
    func filterTasks(by category: TaskCategory) -> [Task] {
        return tasks.filter { $0.category == category && !$0.isCompleted }
    }
}

struct TaskRowView: View {
    let task: Task
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isCompleted ? .green : .gray)
                .font(.title2)
            
            Text(task.category.rawValue)
                .font(.subheadline)
            
            Text(task.title)
                .font(.body)
                .strikethrough(task.isCompleted) 
                .foregroundStyle(task.isCompleted ? .gray : .primary)
            
            Spacer()
        }
        .padding(.vertical, 4)
        .contentShape(Rectangle())
    }
}

struct TaskListView: View {
    @State private var manager = TaskManager(tasks: [
        Task(title: "бегит", category: .cardio),
        Task(title: "анжуманя", category: .strength),
        Task(title: "пресс качат", category: .strength),
        Task(title: "турник", category: .street)
    ])
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(manager.tasks) { task in
                        TaskRowView(task: task)
                            .onTapGesture {
                                withAnimation(.spring(duration: 0.2)) {
                                    manager.toggleTaskCompletion(by: task.id)
                                }
                            }
                        Divider()
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
            .navigationTitle("Мои тренировки")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        guard let randomCategory = TaskCategory.allCases.randomElement() else { return }
                        withAnimation {
                            manager.addTask(title: "Новое упражнение", category: randomCategory)
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}
