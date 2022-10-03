//
//  FirstCellViewModel.swift
//  RXProject
//
//  Created by Harish on 28/09/22.
//

import Foundation

struct FirstCellViewModel {
    private let model: Fact
    
    var fact: String {
        return model.fact ?? "No Fact for this time"
    }
    
    var length: String {
        return "\(model.length ?? 0) characters"
    }
    
    init(model: Fact) {
        self.model = model
    }
}
