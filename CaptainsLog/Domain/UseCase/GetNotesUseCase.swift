//
//  GetNotesUseCase.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 13/4/25.
//

import Foundation
import SwiftData

struct GetNotesUseCase {
    let container: ModelContainer
    
    init(container: ModelContainer) {
        self.container = container
    }
    
    @MainActor
    func invoke() async throws -> [JournalNote] {
        let descriptor = FetchDescriptor<JournalNote>()
        return try container.mainContext.fetch(descriptor)
    }
}
