//
//  AppCoordinator.swift
//  RXProject
//
//  Created by Harish on 23/09/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let firstCoordinator = FirstCoordinator(navigationController: self.navigationController)
        self.childCoordinators.append(firstCoordinator)
        firstCoordinator.parentCoordinator = self
        firstCoordinator.start()
    }
}
