//
// Auto generated file
//

import UIKit

protocol ModuleGenerator {
    func createModule() -> UIViewController
}

enum UserStoriesModulesDefault: ModuleGenerator {

    case loading
    case mainMenu
    case authentication

    func createModule() -> UIViewController {
        switch self {
        case .loading: 
            return LoadingCoordinator.createModule()
        case .mainMenu: 
            return MainMenuCoordinator.createModule()
        case .authentication: 
            return AuthenticationCoordinator.createModule()
        }
    }
}

enum UserStoriesModulesWithOutput: ModuleGenerator {

    case loading(output: LoadingOutput)
    case mainMenu(output: MainMenuOutput)
    case authentication(output: AuthenticationOutput)

    func createModule() -> UIViewController {
        switch self {
        case .loading(let output): 
            return LoadingCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .mainMenu(let output): 
            return MainMenuCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .authentication(let output): 
            return AuthenticationCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        }
    }
}
