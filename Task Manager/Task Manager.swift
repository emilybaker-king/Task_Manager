//
//  Task Manager.swift
//  Task Manager
//
//  Created by Emily Baker-King on 9/13/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import Foundation


class TaskManager {
    
    //persistence
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
    
    //the array of tasks
    var taskArray: [Task] = []
    
    
    //this function will add tasks to the list
    func addTask() {
        
        var taskName: String? = nil
        print("What is your new task?")
        
        //this repeat takes user input to make a task
        repeat {
            let line = readLine()!
            
            if line != "" {
                taskName = line
            } else {
                print("Invalid input")
            }
            break
        } while taskName == nil
        
        
        print("What is the description of your task?")
        var taskDescription: String? = nil
        
        repeat {
            let line = readLine()
            
            if line != "" {
                taskDescription = line
            } else {
                print("Invalid input")
            }
            break
        } while taskDescription == nil
        
        //this repeat takes user input to make a priority and they have to give one of the three values listed
        var taskPriority: String? = nil
        print("Please enter the priority of the task you added: High: H, Average: A, Low: L")
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line == "H" || line == "A" || line == "L" {
                taskPriority = line
            } else {
                print("Invalid input")
                taskPriority = nil
            }
        } while taskPriority == nil
        
        if taskPriority == "H" {
            print("You have 3 days to complete your task")
        }
        if taskPriority == "A" {
            print("You have 5 days to complete your task")
        }
        if taskPriority == "L" {
            print("You have 7 days to complete your task ")
        }
        
        //persistence
        taskArray.append(Task(task: taskName!, priority: taskPriority!, taskDescription: taskDescription!))
        NSKeyedArchiver.archiveRootObject(taskArray, toFile: filePath)
        print("\n")
        print("Your new list of tasks is:")
        
        for task in taskArray {
            print("\(task.task): \(task.taskDescription): \(task.priority)")
        }
        print("\n")
    }
    
    
    //this removes a task
    func removeTask() {
        
        //this lists the tasks and puts them with a number so you can ask the user to put in a value that will be in the index
        for index in 0..<taskArray.count {
            print("\(index). \(taskArray[index].task)")
        }
        
        print("Enter the number of the task you wish to remove:")
        
        //this removes the task that the user puts in
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
    
    //this lists the task that need to be completed
    func listNotCompletedTasks() {
        print("These are the tasks you need to complete:")
        
        for task in getUnavailableTasks() {
            print("\(task.task): \(task.taskDescription): \(task.priority)")
        }
        
        print("\n")
    }
    
    
    //this list all the tasks that are completed
    func listCompletedTasks() {
        
        print("The following tasks are completed:")
        for task in getAvailableTasks() {
            print("\(task.task): \(task.taskDescription): \(task.priority)")
        }
        print("\n")
    }
    
    
    //this puts the tasks that need to be completed into an array
    func getUnavailableTasks() -> [Task] {
        var unavailableTasks = [Task]()
        
        for task in taskArray {
            if !task.completed {
                unavailableTasks.append(task)
            }
        }
        return unavailableTasks
    }
    
    
    //this puts the tasks that are completed into an array
    func getAvailableTasks() -> [Task] {
        var availableTasks = [Task]()
        
        for task in taskArray {
            if task.completed {
                availableTasks.append(task)
            }
        }
        return availableTasks
    }
    
    
    //this lets you complete a task
    func completeTask() {
        
        print("What task do you want to complete?")
        
        //this uses the getunavailableTasks array and list it so it can be used to find the tasks the user wants to complete
        let unavailableTasks = getUnavailableTasks()
        
        if unavailableTasks.count == 0 {
            print("No tasks to complete \n")
            return
        }
        
        //this lists the tasks out so it is easy for the uer to choose one
        for index in 0..<unavailableTasks.count {
            
            print("\(index). \(unavailableTasks[index].task)")
        }
        
        //this repeat keeps going until the user puts in a valid number on the list to complete the task
        let validInput: Int? = nil
        repeat {
            print("Please enter the number of the task you want to complete:")
            var userInput = Int(readLine()!)
            while userInput == nil {
                print("Invalid input. Please enter a number on the list.")
                userInput = Int(readLine()!)
            }
            if userInput! >= taskArray.count {
                print("Invalid input, please type a number on the list.")
            } else {
                taskArray[userInput!].completed = true
                NSKeyedArchiver.archiveRootObject(taskArray, toFile: filePath)
                print("\n You completed: \(taskArray[userInput!].task)\n")
                break
            }
        } while validInput == nil
        print("Good job on completing your task!")
    }
    
    
    //this changes a completed task to incomplete
    func CompleteToIncomplete() {
        
        print("What task do you want to mark incomplete?")
        
        //this uses the getAvailableTasks array to list the tasks that are completed to so they can be chose to be changed to incomplete
        let availableTasks = getAvailableTasks()
        
        if availableTasks.count == 0 {
            print("No completed tasks. \n")
            return
        }
        
        //this lists them so the user can easily find which task they want
        for index in 0..<availableTasks.count {
            
            print("\(index). \(availableTasks[index].task)")
        }
        
        let validInput: Int? = nil
        print("Please enter the number of the task you want to change to incomplete:")
        
        //this repeat makes sure the user input is in the index and if it's not then keeps going until they input something right.
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
                print("You now need to finish \(taskArray[userInput!].task) \n")
                break
            }
        } while validInput == nil
    }
}








