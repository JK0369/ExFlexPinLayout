//
//  VC4.swift
//  ExFlexLayout
//
//  Created by 김종권 on 2023/03/07.
//

import UIKit
import FlexLayout
import PinLayout

// shrink, grow
final class VC4: UIViewController {
    private let container = UIView()
    private let label1: UILabel = {
        let label = UILabel()
        label.text = "label1"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = .lightGray
        return label
    }()
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "label2"
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = .systemBlue
        return label
    }()
    private let label3: UILabel = {
        let label = UILabel()
        label.text = "label3"
//        label.font = .systemFont(ofSize: 70, weight: .bold)
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = .blue
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = .fullScreen
        view.backgroundColor = .white
        
        view.addSubview(container)
//        container.flex.direction(.row).define { flex in
//            flex.addItem(label1)
//                .shrink(3)
//            flex.addItem(label2)
//                .shrink(1)
//            flex.addItem(label3)
//                .shrink(1)
//        }
        
        container.flex.direction(.row).define { flex in
            flex.addItem(label1)
            flex.addItem(label2)
            flex.addItem(label3)
                .grow(1.5)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        container.pin.all()
        container.flex.layout()
    }
}
