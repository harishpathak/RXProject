//
//  FirstViewModel.swift
//  RXProject
//
//  Created by Harish on 23/09/22.
//

import Foundation
import ObjectMapper
import RxSwift

class FirstViewModel {
    var disposeBag = DisposeBag()
    var coordinator: FirstCoordinator!
    var network: NetworkProtocol
    
    let title = "Fun facs about cats"
    
    var cellViewModels = PublishSubject<[FirstCellViewModel]>()
    var selectedViewModel: FirstCellViewModel? {
        didSet {
            guard let model = selectedViewModel else {
                return
            }
            self.navigateToSecond(selected: model)
        }
    }
    
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func navigateToSecond(selected: FirstCellViewModel) {
        self.coordinator.navigateToSecond(model: selected)
    }
    
    func fetchCatFacts() {
        
        self.network.request(endpoint: .facts).subscribe { (response: CatResponse) in
            print("Success: \(response.facts)")
            self.processResults(response: response)
        } onError: { error in
            print("Error: \(error)")
        }.disposed(by: disposeBag)
    }
    
    func processResults(response: CatResponse) {
        var facts = [FirstCellViewModel]()
        for fact in response.facts {
            facts.append(FirstCellViewModel(model: fact))
        }
        cellViewModels.onNext(facts)
    }

}
