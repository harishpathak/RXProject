//
//  FirstCoordinator.swift
//  RXProject
//
//  Created by Harish on 23/09/22.
//

import Foundation
import UIKit

class FirstCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //Instantiate view controller
        let firstVC = FirstViewController.instantiate()
        let network = Network()
        //Create View Model for FirstViewController
        let viewModel = FirstViewModel(network: network)
        //Assign coordinator to view model
        viewModel.coordinator = self
        //Assign view model to view controller
        firstVC.viewModel = viewModel
        //Push view controller
        self.navigationController.pushViewController(firstVC, animated: true)
    }
    
}

extension FirstCoordinator {
    
    func navigateToSecond(model: FirstCellViewModel) {
        let secondCoordinator = SecondCoordinator(navigationConroller: self.navigationController, model: model)
        self.childCoordinators.append(secondCoordinator)
        secondCoordinator.parentCoordinator = self
        secondCoordinator.start()
    }
    
}
