//
//  SecondCoordinator.swift
//  RXProject
//
//  Created by Harish on 23/09/22.
//

import Foundation
import UIKit

class SecondCoordinator: Coordinator {
    var navigationController: UINavigationController
    var selectedModel: FirstCellViewModel
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationConroller: UINavigationController, model: FirstCellViewModel) {
        self.navigationController = navigationConroller
        self.selectedModel = model
    }
    
    func start() {
        //Instantiate view controller
        let secondVC = SecondViewController.instantiate()
        //Create View Model for Second VC
        let viewModel = SecondViewModel(network: Network())
        viewModel.model = selectedModel
        
        //Assign coordinator to view model
        viewModel.coordinator = self
        
        //Assign view model to view controller
        secondVC.viewModel = viewModel
        
        //Push view controller
        self.navigationController.pushViewController(secondVC, animated: true)
    }
    
}
