//
//  Task.swift
//  TaskManager
//
//  Created by Egor Geniberg on 01.11.2026.
//

import Foundation

struct Task: Identifiable {
    let id: UUID = UUID()
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
}
