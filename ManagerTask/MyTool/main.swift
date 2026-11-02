import Foundation

let tasksMananger = TaskManager(tasks: [])

tasksMananger.addTask(title: "Уничтожить бумагу", category: "💼Работа")
tasksMananger.addTask(title: "Поговорить с коллегой у кулера", category: "💼Работа")
tasksMananger.addTask(title: "Дать задания коллегам из ChatGPT", category: "💼Работа")
tasksMananger.addTask(title: "Забрать сына со школы", category: "🧑‍🧑‍🧒‍🧒Семья")
tasksMananger.addTask(title: "Пойти с женой на курсы Беременные мамочки", category: "📚Учеба")
tasksMananger.addTask(title: "Поиграть в GTA VI", category: "🗿Личное")
tasksMananger.addTask(title: "Забрать внебрачного сына", category: "🙆‍♂️Другое")
tasksMananger.addTask(title: "Курсы по постройке домов в Minecraft", category: "📚Учеба")

let filterTasks = tasksMananger.filterTasks(by: TaskCategory.work)
for i in filterTasks {
    print(i)
}
print("______________________________________________\n\n")
tasksMananger.toggleTaskCompletion(by: filterTasks[0].id)

let filterTasks1 = tasksMananger.filterTasks(by: TaskCategory.work)
for i in filterTasks1 {
    print(i)
}
print("______________________________________________\n\n")
tasksMananger.removeTask(by: filterTasks[2].id)
tasksMananger.printTasks()


//print(type(of: tasksMananger.tasks))
