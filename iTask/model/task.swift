//
//  task.swift
//  iTask
//
//  Created by Assan Kabayev on 19.01.2023.
//

import Foundation
import FirebaseFirestoreSwift


struct Task: Identifiable, Codable {
    @DocumentID var id: String?
    @ServerTimestamp var createdAt: Date?
    let title:String
    var isDone: Bool = false
    var doneAt: Date?
    var deadline: Date?
    let uid: String
}
