//
//  RAMyFilesModels.swift
//  MyFilesTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

enum RAMyFilesModel {
    struct DisplayedSection: Equatable {
        
        enum SectionType: Equatable {
            case addFile, files
        }
        
        let type: SectionType
        
        let header: String?
        let footer: String?
        
        struct DisplayedCell: Equatable {
            enum CellType: Equatable {
                case addFile(title: String)
                case file(title: String, imageName: String?)
            }
            
            let type: CellType
        }
        
        let cells: [DisplayedCell]
    }
    
    enum InitialSetup {
        struct Request {
        }
        
        struct Response {
        }
        
        struct ViewModel {
        }
        
    }
    
    enum FetchContent {
        struct Request {
        }
        
        struct Response {
        }
        
        struct ViewModel {
            let sections: [DisplayedSection]
        }
    }
    
}
