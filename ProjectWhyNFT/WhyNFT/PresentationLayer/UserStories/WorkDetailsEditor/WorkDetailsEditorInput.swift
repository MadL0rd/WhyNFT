//
//  WorkDetailsEditorInput.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

protocol CustomizableWorkDetailsEditorViewModel: AnyObject {
    
    var output: WorkDetailsEditorOutput? { get set }
    
    var artWork: ArtWork! { get set }
}
