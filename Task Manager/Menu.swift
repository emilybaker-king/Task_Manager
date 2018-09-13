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
        let menuOptions = Array(1...8)
        
        guard let number = Int(input) else { return false }
        
        return menuOptions.contains(number)
    }
    
    
    func quit() {
        shouldQuit = true
        print("Thanks for using the video game library")
    }
    
    
    
    func menuOptions() {
        print("""
            Menu
            1 List all tasks
            2 List uncompleted tasks
            3 List completed tasks
            4 Mark task as complete
            5 Change a completed task to incomplete
            6 Delete a task
            7 Help
            8 Exit program

            """)
    }
    
    
    func handleInput(_ input: String) {
        switch input {
        case "1":

            menuOptions()
        case "2":
           
            menuOptions()
        case "3":
           
            menuOptions()
        case "4":
           
            menuOptions()
        case "5":
            
            menuOptions()
        case "6":
          
            menuOptions()
        case "7":
            menuOptions()
        case "8":
            quit()
        default:
            break
        }
    }
    
    
    
}
