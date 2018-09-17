//
//  main.swift
//  Task Manager
//
//  Created by Emily Baker-King on 9/12/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import Foundation

print("Welcome to your task manager:")
let menu = Menu()

print("Password:")
var input: String? = nil
repeat {
    let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if line == "password" {
        input = line
    } else {
        print("Invalid password")
    }
} while input == nil

menu.go()

