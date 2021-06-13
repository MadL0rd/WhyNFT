//
//  WorkDetailsEditorViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

final class WorkDetailsEditorViewModel {
	var output: WorkDetailsEditorOutput?
    
    var artWork: ArtWork!
}

// MARK: - Configuration
extension WorkDetailsEditorViewModel: CustomizableWorkDetailsEditorViewModel {

}

// MARK: - Interface for view
extension WorkDetailsEditorViewModel: WorkDetailsEditorViewModelProtocol {

}

