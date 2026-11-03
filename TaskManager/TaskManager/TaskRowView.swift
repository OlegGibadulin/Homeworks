//
//  TaskRowView.swift
//  TaskManager
//
//  Created by Egor Geniberg on 01.11.2026.
//

import SwiftUI

struct TaskRowView: View {
    let task: Task
    
    var body: some View {
        HStack {
            // Иконка категории
            Image(systemName: categorySymbol)
                .foregroundStyle(.blue)
            
            // Название и категория
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                
                Text(task.category.rawValue)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // Статус выполнения
            Image(systemName: task.isCompleted
                  ? "checkmark.circle.fill"
                  : "circle")
                .foregroundStyle(
                    task.isCompleted ? .green : .gray
                )
                .font(.title2)
        }
        .padding(.vertical, 4)
    }
    
    private var categorySymbol: String {
        switch task.category {
        case .work:
            return "briefcase"
        case .study:
            return "book"
        case .personal:
            return "person"
        }
    }
}
