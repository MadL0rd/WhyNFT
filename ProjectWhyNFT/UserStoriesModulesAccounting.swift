//
// Auto generated file
//

import UIKit

protocol ModuleGenerator {
    func createModule() -> UIViewController
}

enum UserStoriesModulesDefault: ModuleGenerator {

    case settings
    case loading
    case works
    case mainMenu
    case salesHistory
    case authentication

    func createModule() -> UIViewController {
        switch self {
        case .settings: 
            return SettingsCoordinator.createModule()
        case .loading: 
            return LoadingCoordinator.createModule()
        case .works: 
            return WorksCoordinator.createModule()
        case .mainMenu: 
            return MainMenuCoordinator.createModule()
        case .salesHistory: 
            return SalesHistoryCoordinator.createModule()
        case .authentication: 
            return AuthenticationCoordinator.createModule()
        }
    }
}

enum UserStoriesModulesWithOutput: ModuleGenerator {

    case settings(output: SettingsOutput)
    case loading(output: LoadingOutput)
    case works(output: WorksOutput)
    case mainMenu(output: MainMenuOutput)
    case salesHistory(output: SalesHistoryOutput)
    case authentication(output: AuthenticationOutput)

    func createModule() -> UIViewController {
        switch self {
        case .settings(let output): 
            return SettingsCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .loading(let output): 
            return LoadingCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .works(let output): 
            return WorksCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .mainMenu(let output): 
            return MainMenuCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .salesHistory(let output): 
            return SalesHistoryCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .authentication(let output): 
            return AuthenticationCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        }
    }
}
