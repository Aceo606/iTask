//
//  TasksVCDelegate.swift
//  iTask
//
//  Created by Assan Kabayev on 19.01.2023.
//

import Foundation

protocol NewTaskVSDelegate: class {
    func didAddTask(_ task: Task)
    func didEditTask(_ task: Task)
}
