import Foundation
import SwiftData

struct ViewModelFactory {
    private let container: ModelContainer
    
    init(container: ModelContainer) {
        self.container = container
    }
    
    func makeJournalViewModel() -> JournalViewModel {
        let useCase = GetNotesUseCase(container: container)
        return JournalViewModel(getNotes: useCase)
    }
    
    func makeTabBarViewModel() -> MainTabBarViewModel {
        return MainTabBarViewModel()
    }
}
