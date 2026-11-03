//
//  TaskRowView.swift
//  UIVKSwiftHomeworks
//
//  Created by Daniil Sukhanov on 27.10.2026.
//

import SwiftUI

struct TaskRowView: View {
    let task: Task
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Text(task.category.rawValue)
                .font(.title3)

            Text(task.title)
                .foregroundColor(task.isCompleted ? .gray : .primary)
                .strikethrough(task.isCompleted, color: .gray)

            Spacer()

            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .blue)
                .font(.title2)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onToggle()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    VStack {
        TaskRowView(
            task: Task(title: "Закончить отчёт", category: .work),
            onToggle: {}
        )
        TaskRowView(
            task: Task(title: "Купить молоко", isCompleted: true, category: .personal),
            onToggle: {}
        )
    }
    .padding()
}
