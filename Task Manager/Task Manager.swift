//
//  Task Manager.swift
//  Task Manager
//
//  Created by Emily Baker-King on 9/13/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import Foundation


class TaskManager {
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return (url?.appendingPathComponent("Data").path)!
    }
    
    init() {
        if let task = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Task] {
            taskArray = task
        }
    }
    
    var taskArray: [Task] = []
    
    func addTask() {
        
        var taskName: String? = nil
        print("What is your new task?")
        
        repeat {
            let line = readLine()!
            
            if line != "" {
                taskName = line
            } else {
                print("Invalid input")
            }
            break
        } while taskName == nil
        
        taskArray.append(Task(task: taskName!))
        NSKeyedArchiver.archiveRootObject(taskArray, toFile: filePath)
        print("\n")
        print("Your new list of tasks is:")
        
        for task in taskArray {
            print(task.task)
        }
        print("\n")
    }
    
    
    
    
    
}























