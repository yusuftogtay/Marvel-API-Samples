//
//  MainCoordinator.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 13.07.2021.
//

import Foundation
import UIKit

class MainCordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    func addChild(coordinator: Coordinator) {
        
    }
    
    func removeChild(coordinator: Coordinator) {
        
    }
    

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let vc: CharactersListViewController  = CharactersListViewController(nibName: "CharactersListViewController", bundle: nil)
        vc.coordinator = self
        navigationController.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func detail(item: Character) {
        let vc = CharacterDetailsViewController(nibName: nil, bundle: nil)
        print("called")
        vc.character = item
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        addChild(coordinator: vc.coordinator!)
    }
}
