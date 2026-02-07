//
//  JournalRouting.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 25/1/26.
//

import SwiftUI

public enum JournalRoute: Hashable {
    case noteDetail(JournalNote)
    case newNote(JournalNote)
}

extension AppRouter {
    public func navigateTo(journalRoute: JournalRoute) {
        switch journalRoute {
        case .noteDetail(let journalNote):
            navigate(to: .journal(.noteDetail(journalNote)))
        case .newNote(let journalNote):
            navigate(to: .journal(.newNote(journalNote)))
        }
    }
}

