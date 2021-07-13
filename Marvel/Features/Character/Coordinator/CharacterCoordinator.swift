//
//  CharacterCoordinator.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 13.07.2021.
//

import Foundation
import UIKit

class CharacterCordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    func start() {
        
    }
    
    func addChild(coordinator: Coordinator) {
        
    }
    
    func removeChild(coordinator: Coordinator) {
        
    }
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func go(item: Character) {
        let vc = CharacterDetailsViewController(nibName: nil, bundle: nil)
        vc.character = item
        vc.coordinator = self
        navigationController.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
}
