//
//  CalendarViewDelegate.swift
//  iTask
//
//  Created by Assan Kabayev on 20.01.2023.
//

import Foundation


protocol CalendarViewDelegate: class {
    func calendarViewDidSelectDate(date: Date)
    func calendarViewDidTapRemoveButton()
}
