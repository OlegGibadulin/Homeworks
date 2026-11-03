import SwiftUI

struct TaskRowView:View{
    let task: Task
    var body: some View{
        HStack(){
            Text(task.title)
            Spacer()
            if let firstChar = task.category.rawValue.first {
                Text(String(firstChar))
                    .padding(.trailing, 40)
            }
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            .black.opacity(0.5),
            in : RoundedRectangle(cornerRadius: 40)
        )
        .overlay(alignment: .topTrailing) {
            Image(
                systemName: task.isCompleted
                ? "checkmark.circle.fill"
                : "circle.fill"
            )
            .foregroundStyle(task.isCompleted ? .green : .blue.opacity(1))
        }
    }
}

