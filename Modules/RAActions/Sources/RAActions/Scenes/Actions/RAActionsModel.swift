//
//  RAActionsModel.swift
//  ActionsTestApp
//
//  Created by Раис Аглиуллов on 29.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

enum RAActionsModel {
    struct DisplayedSection: Equatable {
        
        enum SectionType: Equatable {
            case test
        }
        
        let type: SectionType
        
        let header: String?
        let footer: String?
        
        struct DisplayedCell: Equatable {
            enum CellType: Equatable {
                case test(title: String)
            }
            
            let type: CellType
        }
        
        let cells: [DisplayedCell]
    }
    
    enum FetchNavigationTitle {
        struct ViewModel {
            let title: String
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
    
    enum SetupTabbarItem {
        struct ViewModel {
            let title: String
            let image: UIImage?
            let selectedImage: UIImage?
        }
    }
    
}
