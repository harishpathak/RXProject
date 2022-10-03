//
//  SecondViewModel.swift
//  RXProject
//
//  Created by Harish on 28/09/22.
//

import Foundation
import RxSwift
import RxRelay

class SecondViewModel {
//    var disposeBag = DisposeBag()
    var coordinator: SecondCoordinator!
    var network: NetworkProtocol
    
    var details = BehaviorRelay<String>(value: "")
    
    var model: FirstCellViewModel! {
        didSet {
            details.accept(model.fact)
        }
    }
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
}
