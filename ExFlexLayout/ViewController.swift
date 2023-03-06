//
//  ViewController.swift
//  ExFlexLayout
//
//  Created by 김종권 on 2023/03/06.
//

import UIKit
import FlexLayout
import PinLayout

class ViewController: UIViewController {
    private let container = UIView()
    private let label1: UILabel = {
        let label = UILabel()
        label.text = "label1"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = .lightGray
        return label
    }()
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "label2"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = .systemBlue
        return label
    }()
    private let label3: UILabel = {
        let label = UILabel()
        label.text = "label2"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = .blue
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(container)
        container.flex.alignItems(.center).define { flex in
            flex.addItem(label1)
                .marginTop(10)
            flex.addItem(label2)
            flex.addItem(label3)
        }
        
        container.flex.justifyContent(.center).define { flex in
            flex.addItem(label1)
                .marginTop(10)
            flex.addItem(label2)
            flex.addItem(label3)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            // tableView
//            self.present(VC2(), animated: true)
            
            // scrollView
            self.present(VC3(), animated: true)
        })
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        container.pin.all(view.pin.safeArea)
        container.flex.layout()
    }
}
