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
        return (url?.appendingPathComponent("Tasks").path)!
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
    
    
    func removeTask() {
        
        for index in 0..<taskArray.count {
            print("\(index). \(taskArray[index].task)")
        }
        
        print("Enter the number of the game you wish to remove:")
        
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input. Please enter a usable number")
            userInput = Int(readLine()!)
        }
        print("\n")  
        taskArray.remove(at: userInput!)
        NSKeyedArchiver.archiveRootObject(taskArray, toFile: filePath)
        print("\n")
        
    }
    
    
    func listNotCompletedTasks() {
        print("These are the tasks you need to complete:")
        
        for index in 0..<taskArray.count {
            if !taskArray[index].completed {
                print("\(index). \(taskArray[index].task)")
            }
        }
      
        print("\n")
    }
    
    
    func listCompletedTasks() {
        
        print("The following tasks are completed:")
        for index in 0..<taskArray.count {
            if taskArray[index].completed {
                print("\(index). \(taskArray[index].task)")
            }
        }
        print("\n")
    }
    
    
    
    func completeTask() {
        
        print("What task do you want to complete?")
        
        listNotCompletedTasks()
        
        let validInput: Int? = nil
        print("Please enter the number of the task you want to complete:")
        repeat {
            
            var userInput = Int(readLine()!)
            while userInput == nil {
                print("Invalid input. Please enter a usable number.")
                userInput = Int(readLine()!)
            }
            if userInput! > taskArray.count {
                print("Invalid input, please type a number on the list.")
                userInput = Int(readLine()!)
            } else {
                taskArray[userInput!].completed = true
                NSKeyedArchiver.archiveRootObject(taskArray, toFile: filePath)
                print("\n You completed: \(taskArray[userInput!].task)\n")
                break
            }
        } while validInput == nil
        print("Good job on completing your task!")
    }
    
    
    
    func CompleteToIncomplete() {
        
        print("What task do you want to mark incomplete?")
        
        listCompletedTasks()
        
        let validInput: Int? = nil
        print("Please enter the number of the task you want to change to incomplete:")

        repeat {
            var userInput = Int(readLine()!)
            while userInput == nil {
                print("Invalid input. Please enter a usable number.")
                userInput = Int(readLine()!)
            }
            if userInput! >= taskArray.count {
                print ("Please enter a valid number")
            } else {
                taskArray[userInput!].completed = false
                NSKeyedArchiver.archiveRootObject(taskArray, toFile: filePath)
                print("Thank you for checking in \(taskArray[userInput!].task) \n")
                break
            }
        } while validInput == nil
    }
}








