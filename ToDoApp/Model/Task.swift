//
//  Task.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import Foundation
import SwiftUI
import SwiftData

enum Priority: Int, CaseIterable{
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
    
    func primaryColor() -> Color {
        switch self {
        case .low:
            return Color("LowDarkGreen")
        case .normal:
            return Color("MediumDarkYellow")
        case .high:
            return Color("HighDarkRed")
        }
    }

    func secondaryColor() -> Color {
        switch self {
        case .low:
            return Color("LowLightGreen")
        case .normal:
            return Color("MediumLightYellow")
        case .high:
            return Color("HighLightRed")
        }
    }
}

enum Category: Int, CaseIterable{
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
    
    func iconImageName() -> String {
        switch self {
        case .office:
            return "briefcase.fill"
        case .personal:
            return "person.circle.fill"
        case .study:
            return "book.pages.fill"
        }
    }
    
    func primaryColor() -> Color {
        switch self {
        case .office:
            return Color("OfficePrimaryColor")
        case .personal:
            return Color("PersonalPrimaryColor")
        case .study:
            return Color("StudyPrimaryColor")
        }
    }

    func secondaryColor() -> Color {
        switch self {
        case .office:
            return Color("OfficeSecondaryColor")
        case .personal:
            return Color("PersonalSecondaryColor")
        case .study:
            return Color("StudySecondaryColor")
        }
    }
}

@Model class Task: Identifiable {
    var id = UUID()
    var title: String
    @Transient var priority: Priority {
        get {
            return Priority(rawValue: Int(priorityNum)) ?? .normal
        }
        set {
            self.priorityNum = Int(newValue.rawValue)
        }
    }
    @Attribute(originalName: "priority") var priorityNum: Priority.RawValue
    @Transient var category: Category {
        get {
            return Category(rawValue: Int(categoryNum)) ?? .office
        }
        set {
            self.categoryNum = Int(newValue.rawValue)
        }
    }
    @Attribute(originalName: "category") var categoryNum: Category.RawValue
    var date: Date
    var time: Date
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String = "", priority: Priority = .normal, category: Category = .personal, date: Date = Date(), time: Date = Date(), isCompleted: Bool = false) {
        self.title = title
        self.date = date
        self.time = time
        self.isCompleted = isCompleted
        self.priorityNum = priority.rawValue
        self.categoryNum = category.rawValue
        self.priority = priority
        self.category = category
    }
    
}
