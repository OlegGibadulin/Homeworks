//
//  Task.swift
//  UIVKSwiftHomeworks
//
//  Created by Daniil Sukhanov on 27.10.2026.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool = false
    let category: TaskCategory
}
