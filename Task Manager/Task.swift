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
    
    var completed = true
    
    var dueDate: Date?
    
    
    init(task: String) {
        self.task = task
    }
    
    
    
    init(task: String, completed: Bool, dueDate: Date?) {
        self.task = task
        self.completed = completed
        self.dueDate = dueDate
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(task, forKey: "task")
        aCoder.encode(completed, forKey: "completed")
        aCoder.encode(dueDate, forKey: "dueDate")
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        guard let task = aDecoder.decodeObject(forKey: "task") as? String
            else {
                return nil
        }
        
        let completed = aDecoder.decodeBool(forKey: "completed")
        
        if let dueDate = aDecoder.decodeObject(forKey: "dueDate") as? Date {
            self.init(task: task, completed: completed, dueDate: dueDate)
        } else {
            self.init(task: task, completed: completed, dueDate: nil)
        }
    }
    
}


