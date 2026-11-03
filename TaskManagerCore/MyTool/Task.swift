//
//  Task.swift
//  MyTool
//
//  Created by Egor Geniberg on 20.10.2026.
//

import Foundation

struct Task: Identifiable {
    let id: UUID = UUID()
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
}
