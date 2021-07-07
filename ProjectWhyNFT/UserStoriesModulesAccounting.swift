//
// Auto generated file
//

import UIKit

protocol ModuleGenerator {
    func createModule() -> UIViewController
}

enum UserStoriesModulesDefault: ModuleGenerator {

    case settings
    case aboutUs
    case loading
    case portfolioAuthInformation
    case workDetailsEditor
    case works
    case mainMenu
    case salesHistory
    case portfolioAuthentication
    case raribleAuthentication

    func createModule() -> UIViewController {
        switch self {
        case .settings: 
            return SettingsCoordinator.createModule()
        case .aboutUs: 
            return AboutUsCoordinator.createModule()
        case .loading: 
            return LoadingCoordinator.createModule()
        case .portfolioAuthInformation: 
            return PortfolioAuthInformationCoordinator.createModule()
        case .workDetailsEditor: 
            return WorkDetailsEditorCoordinator.createModule()
        case .works: 
            return WorksCoordinator.createModule()
        case .mainMenu: 
            return MainMenuCoordinator.createModule()
        case .salesHistory: 
            return SalesHistoryCoordinator.createModule()
        case .portfolioAuthentication: 
            return PortfolioAuthenticationCoordinator.createModule()
        case .raribleAuthentication: 
            return RaribleAuthenticationCoordinator.createModule()
        }
    }
}

enum UserStoriesModulesWithOutput: ModuleGenerator {

    case settings(output: SettingsOutput)
    case aboutUs(output: AboutUsOutput)
    case loading(output: LoadingOutput)
    case portfolioAuthInformation(output: PortfolioAuthInformationOutput)
    case workDetailsEditor(output: WorkDetailsEditorOutput)
    case works(output: WorksOutput)
    case mainMenu(output: MainMenuOutput)
    case salesHistory(output: SalesHistoryOutput)
    case portfolioAuthentication(output: PortfolioAuthenticationOutput)
    case raribleAuthentication(output: RaribleAuthenticationOutput)

    func createModule() -> UIViewController {
        switch self {
        case .settings(let output): 
            return SettingsCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .aboutUs(let output): 
            return AboutUsCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .loading(let output): 
            return LoadingCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .portfolioAuthInformation(let output): 
            return PortfolioAuthInformationCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .workDetailsEditor(let output): 
            return WorkDetailsEditorCoordinator.createModule { viewModel in 
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
            
        case .portfolioAuthentication(let output): 
            return PortfolioAuthenticationCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        case .raribleAuthentication(let output): 
            return RaribleAuthenticationCoordinator.createModule { viewModel in 
                viewModel.output = output
            }
            
        }
    }
}
