//
//  Task.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import Foundation

enum Priority: Int{
    case low = 1
    case normal = 2
    case high = 3
    
    func toString() -> String {
        switch self {
        case .low:
            return "Low"
        case .normal:
            return "Medium"
        case .high:
            return "High"
        }
    }
}

enum Category: Int{
    case office = 1
    case personal = 2
    case study = 3
    
    func toString() -> String {
        switch self {
        case .office:
            return "Office Project"
        case .personal:
            return "Personal Project"
        case .study:
            return "Daily Study"
        }
    }
}


@Observable class Task: Identifiable {
    var id = UUID()
    var title: String
    var priority: Priority
    var category: Category
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String = "", priority: Priority = .normal, category: Category = .personal, isCompleted: Bool = false) {
        self.title = title
        self.priority = priority
        self.category = category
        self.isCompleted = isCompleted
    }
    
}
