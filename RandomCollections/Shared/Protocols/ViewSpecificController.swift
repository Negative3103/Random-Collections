//
//  ViewSpecificController.swift
//  RandomCollections
//
//  Created by Хасан Давронбеков on 04/03/24.
//

import UIKit

protocol ViewSpecificController {
    associatedtype RootView: UIView
}

extension ViewSpecificController where Self: UIViewController {
    func view() -> RootView {
        return self.view as! RootView
    }
}
