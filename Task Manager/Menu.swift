//
//  Menu.swift
//  Task Manager
//
//  Created by Emily Baker-King on 9/12/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import Foundation


class Menu {
    
    
    var shouldQuit = false 
    
    let taskManager = TaskManager()
    
    func go() {
        menuOptions()
        
        repeat {
            
            var input = getInput()
            
            while validateInput(input) == false {
                print("Invalid input")
                input = getInput()
            }
            
            handleInput(input)
            
            
        } while !shouldQuit
    }
    
    
    func getInput () -> String {
        var input: String? = nil
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input")
            }
        } while input == nil
        
        return input!
    }
    
    
    func validateInput (_ input: String) -> Bool {
        let menuOptions = Array(1...9)
        
        guard let number = Int(input) else { return false }
        
        return menuOptions.contains(number)
    }
    
    

    
    func quit() {
        shouldQuit = true
        print("Thanks for using the task manager")
    }
    
    
    
    func menuOptions() {
        print("""
            Menu
            1 List all tasks
            2 List uncompleted tasks
            3 List completed tasks
            4 Mark task as complete
            5 Change a completed task to incomplete
            6 Add a task
            7 Delete a task
            8 Help
            9 Exit program

            """)
    }
    
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
            taskManager.listCompletedTasks()
            taskManager.listNotCompletedTasks()
            menuOptions()
        case "2":
           taskManager.listNotCompletedTasks()
            menuOptions()
        case "3":
           taskManager.listCompletedTasks()
            menuOptions()
        case "4":
           taskManager.completeTask()
            menuOptions()
        case "5":
            taskManager.CompleteToIncomplete()
            menuOptions()
        case "6":
            taskManager.addTask()
            menuOptions()
        case "7":
          taskManager.removeTask()
            menuOptions()
        case "8":
            menuOptions()
        case "9":
            quit()
        default:
            break
        }
    }
}
