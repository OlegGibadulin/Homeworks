import SwiftUI

struct TaskListView: View {
    @State var manager = TaskManager()
    @State var inputTitleText: String = ""
    @State var selectedCategory:TaskCategory?
    @State var inputSelectedCategory:TaskCategory?
    @State var titleText = ""
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    TaskListContentView(manager: manager)
                }
                .navigationTitle("Мои задачи")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            if let randomCategory = TaskCategory.allCases.randomElement(){
                                manager.AddTask("Новая задача", randomCategory)
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                VStack{
                    АddTaskBar(manager: manager, inputTitleText: $inputTitleText, selectedCategory: $selectedCategory, inputSelectedCategory: $inputSelectedCategory, titleText: $titleText)
                    
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

#Preview {
    TaskListView()
}
