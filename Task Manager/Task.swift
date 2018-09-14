//
//  Task.swift
//  Task Manager
//
//  Created by Emily Baker-King on 9/13/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {
    
    var task: String
    
    var completed = false
    
    var dueDate: Date?
    
     var priority: String
    
    init(task: String, priority: String) {
        self.task = task
        self.priority = priority
    }
    
    
    
    init(task: String, completed: Bool, dueDate: Date?, priority: String) {
        self.task = task
        self.completed = completed
        self.dueDate = dueDate
        self.priority = priority
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(task, forKey: "task")
        aCoder.encode(completed, forKey: "completed")
        aCoder.encode(dueDate, forKey: "dueDate")
        aCoder.encode(priority, forKey: "priority")
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        guard let task = aDecoder.decodeObject(forKey: "task") as? String
            else {
                return nil
        }
        
        guard let priority = aDecoder.decodeObject(forKey: "priority") as? String
            else {
                return nil
        }
        
        let completed = aDecoder.decodeBool(forKey: "completed")
        
        if let dueDate = aDecoder.decodeObject(forKey: "dueDate") as? Date {
            self.init(task: task, completed: completed, dueDate: dueDate, priority: priority)
        } else {
            self.init(task: task, completed: completed, dueDate: nil, priority: priority)
        }
        
    }
    
}


