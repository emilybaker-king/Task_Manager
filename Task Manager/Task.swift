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
    
    var taskDescription: String
    
    init(task: String, priority: String, taskDescription: String) {
        self.task = task
        self.priority = priority
        self.taskDescription = taskDescription
    }
    
    
    //this initializes the above variables
    init(task: String, completed: Bool, dueDate: Date?, priority: String, taskDescription: String) {
        self.task = task
        self.completed = completed
        self.dueDate = dueDate
        self.priority = priority
        self.taskDescription = taskDescription
    }
    
    //this is the persistence
    func encode(with aCoder: NSCoder) {
        aCoder.encode(task, forKey: "task")
        aCoder.encode(completed, forKey: "completed")
        aCoder.encode(dueDate, forKey: "dueDate")
        aCoder.encode(priority, forKey: "priority")
        aCoder.encode(taskDescription, forKey: "taskDescription")
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
        
        guard let taskDescription = aDecoder.decodeObject(forKey: "taskPriority") as? String
            else {
                return nil
        }
        
        
        let completed = aDecoder.decodeBool(forKey: "completed")
        
        if let dueDate = aDecoder.decodeObject(forKey: "dueDate") as? Date {
            self.init(task: task, completed: completed, dueDate: dueDate, priority: priority, taskDescription: taskDescription)
        } else {
            self.init(task: task, completed: completed, dueDate: nil, priority: priority, taskDescription: taskDescription)
        }
        
    }
    
}


