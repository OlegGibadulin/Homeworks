let manager = TaskManager(tasks: TaskSeeder.seedTasks())
let ui = ConsoleUI()
var isRunning = true
while isRunning {
    print("""
        
        ==============================
                МЕНЕДЖЕР ЗАДАЧ
        ==============================
            1. Добавить задачу
            2. Удалить задачу
            3. Изменить статус задачи
            4. Фильтр невыполненных задач
            5. Показать все задачи
            0. Выход
        """)
    
    guard let choice = ui.readInt(prompt: "Выберите действие:") else {
        continue
    }
    
    switch choice {
    case 1:
        ui.addTask(to: manager)
    case 2:
        ui.removeTask(from: manager)
    case 3:
        ui.toggleTask(in: manager)
    case 4:
        ui.filterTasks(in: manager)
    case 5:
        print("\nВсе задачи:")
        ui.printTasks(manager.allTasks)
    case 0:
        isRunning = false
        print("Программа завершена.")
    default:
    print("Неизвестная команда. Попробуйте еще раз.")
    }
    
    if isRunning {
        print("\nНажмите Enter, чтобы продолжить.")
        _ = readLine()
    }
}

