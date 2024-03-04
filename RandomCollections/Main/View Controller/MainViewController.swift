//
//  MainViewController.swift
//  RandomCollections
//
//  Created by Хасан Давронбеков on 04/03/24.
//

import UIKit

final class MainViewController: UIViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = MainView
    
    //MARK: - Attributes
    private var dataProvider = MainDataProvider()
    private var data: [[Int]] = []
    private var timer: Timer?

    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
        setupData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view().tableView.invalidateIntrinsicContentSize()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
    }
    
}

//MARK: - Other funcs
extension MainViewController {
    private func appearanceSettings() {
        dataProvider.viewController = self
        dataProvider.tableView = view().tableView
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateRandomNumbers), userInfo: nil, repeats: true)
    }
    
    private func setupData() {
        for _ in 0...110 {
            var innerArray: [Int] = []
            let innerArrayCount = Int.random(in: 11...20)
            for _ in 0..<innerArrayCount {
                innerArray.append(Int.random(in: 0...110))
            }
            data.append(innerArray)
        }
        setupItems()
    }
    
    private func setupItems() {
        var items: [MainCollection] = []
        for (index, innerArray) in data.enumerated() {
            let randomModel = MainCollection(sections: index, items: innerArray)
            items.append(randomModel)
        }
        dataProvider.items = items
    }
    
    @objc private func updateRandomNumbers() {
        for i in 0..<data.count {
            let indexPath = IndexPath(row: i, section: 0)
            if let cell = view().tableView.cellForRow(at: indexPath) as? RandomTableViewCell {
                let randomIndex = Int.random(in: 0..<data[i].count)
                cell.randomContainerView.dataProvider.items[randomIndex] = Int.random(in: 1...100)
            }
        }
    }
}
