//
//  FirstViewController.swift
//  RXProject
//
//  Created by Harish on 22/09/22.
//

import UIKit
import RxCocoa
import RxSwift

class FirstViewController: UIViewController {
    var viewModel: FirstViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let bag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.bindUI()
    }
    
    func configureUI() {
        self.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.tableView.rx.setDelegate(self).disposed(by: bag)
    }
    
    func bindUI() {
        viewModel.cellViewModels.bind(to: tableView.rx.items(cellIdentifier: "table_cell", cellType: FirstViewCell.self)) { (row, item, cell) in
            cell.model = item
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(FirstCellViewModel.self).subscribe(onNext: { [weak self] item in
            self?.viewModel.selectedViewModel = item
        }).disposed(by: bag)
        
        self.viewModel.fetchCatFacts()
    }
    
    static func instantiate() -> FirstViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
        return vc as! FirstViewController
    }

    
}

extension FirstViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
