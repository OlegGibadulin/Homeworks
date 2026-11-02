import SwiftUI
import Foundation

enum TaskCategory: String, CaseIterable{
    case work = "👩‍💻Work"
    case study = "📚Study"
    case personal = "🏂Chill"
}

struct Task: Identifiable{
    let id : UUID
    let title: String
    var isCompleted: Bool
    let category: TaskCategory
}
@Observable
class TaskManager {
    fileprivate var Tasks:[Task] = []
     
    func AddTask(_ title: String, _ category: TaskCategory){
        let NewTask = Task(id: UUID(), title: title, isCompleted: false, category: category)
        Tasks.append(NewTask)

    }
    
    func RemoveTask(_ id: UUID){
        if Tasks.contains(where: {task in task.id == id}){
            Tasks.removeAll(where: {$0.id == id})
        }
        else{
            print("Can't find task with this id")
        }
    }

    func toggleTaskCompletion(_ id: UUID){
        if let index = Tasks.firstIndex(where: {task in task.id == id}){
            Tasks[index].isCompleted.toggle()
        }
        else{
            print("Can't find task with this id")
        }
    }
    
    func filterTasks(_ category: TaskCategory) -> [Task]{
        return Tasks.filter{task in (task.category == category && !task.isCompleted)}
    }
    
    func RemoveAll(){
        Tasks.removeAll()
    }
}

struct ContentView: View {
    @State var Manager = TaskManager()
    @State var inputTitleText: String = ""
    @State var selectedCategory:TaskCategory?
    @State var inputSelectedCategory:TaskCategory?
    @State var titleText = ""
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    basicFunctionality(Manager: Manager)
                }
                    .navigationTitle("Мои задачи")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                Manager.AddTask("начать читать рэп", .personal)
                                Manager.AddTask("начать делать курсач", .study)
                                print("Количество задач: \(Manager.Tasks.count)")
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                VStack{
                    //Spacer()   // Вот этот спейсер почему то надо убрать(особенность ScrollView)
                    addTaskBar(Manager: Manager, inputTitleText: $inputTitleText, selectedCategory: $selectedCategory, inputSelectedCategory: $inputSelectedCategory, titleText: $titleText)
                    
                    Picker("Категория", selection: $inputSelectedCategory){
                        ForEach(TaskCategory.allCases, id: \.rawValue){
                            category in Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }
            }
            
            .background {
                LinearGradient(
                    colors: [.gray, .white],
                    startPoint: .top,
                    endPoint: .bottom)
                .ignoresSafeArea()
                
            }
        }
        
    }
}
struct basicFunctionality: View{
    var Manager: TaskManager
    var body: some View{
        VStack(alignment: .leading){
            if !Manager.Tasks.isEmpty{
                ForEach(Manager.Tasks) { task in
                    createTaskIcon(task)
                    .onTapGesture {
                    Manager.toggleTaskCompletion(task.id)
                    }
                }
                Spacer()
            }
        }
    }
}


struct addTaskBar: View{
    var Manager: TaskManager
    @Binding var inputTitleText: String
    @Binding var selectedCategory:TaskCategory?
    @Binding var inputSelectedCategory:TaskCategory?
    @Binding var titleText: String
    var body: some View{
        HStack{
            TextField("Купить хлеб", text: $inputTitleText)
                .foregroundStyle(.black)
                .padding(10)
                .frame(width: 300)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                        .stroke(.black, lineWidth: 2)
                }
            
            Button(action: {
                titleText = inputTitleText
                selectedCategory = inputSelectedCategory
                if let selectedCategory{
                    Manager.AddTask(titleText, selectedCategory)
                }
            },
                   label: {
                    Image(systemName: "plus.circle")
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        .black, in: RoundedRectangle(cornerRadius: 10)
                    )
                        })
        }
    }
}

func createTaskIcon(_ Task:Task) -> some View{
    HStack(){
        Text(Task.title)
                Spacer()
        
        if let firstChar = Task.category.rawValue.first {
            Text(String(firstChar))
                .padding(.trailing, 40)
        }
        }

            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(
                .black.opacity(0.5),
                in : RoundedRectangle(cornerRadius: 40)
            )
            .overlay(alignment: .topTrailing) {
            Image(
                systemName: Task.isCompleted
                ? "checkmark.circle.fill"
                : "xmark.circle.fill"
            )
            .foregroundStyle(Task.isCompleted ? .green : .red)
        }
    }


#Preview {
    ContentView()
}
