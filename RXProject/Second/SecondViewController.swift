//
//  SecondViewController.swift
//  RXProject
//
//  Created by Harish on 22/09/22.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController {

    @IBOutlet weak var detailsLabel: UILabel!
    let bag = DisposeBag()
    
    var viewModel: SecondViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindUI()
    }
    
    func bindUI() {
        //1
        viewModel.details.bind(to: detailsLabel.rx.text).disposed(by: bag)
        //2 
//        viewModel.details.subscribe(onNext: { text in
//            self.detailsLabel.text = text
//        }).disposed(by: bag)
    }
    
    
    static func instantiate() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        return vc as! SecondViewController
    }
    
}
