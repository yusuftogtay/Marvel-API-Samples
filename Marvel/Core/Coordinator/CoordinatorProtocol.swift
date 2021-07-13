//
//  CoordinatorProtocol.swift
//  Marvel
//
//  Created by Ahmet Yusuf TOĞTAY on 13.07.2021.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
    func addChild(coordinator: Coordinator)
    func removeChild(coordinator: Coordinator)
}
