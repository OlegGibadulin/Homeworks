import SwiftUI

struct  АddTaskBar: View{
    var manager: TaskManager
    @Binding var inputTitleText: String
    @Binding var selectedCategory:TaskCategory?
    @Binding var inputSelectedCategory:TaskCategory?
    @Binding var titleText: String
    var body: some View{
        HStack{
            TextField("Купить хлеб", text: $inputTitleText)
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
                    manager.AddTask(titleText, selectedCategory)
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
