//
//  VC3.swift
//  ExFlexLayout
//
//  Created by 김종권 on 2023/03/06.
//

import UIKit
import FlexLayout
import PinLayout

// scrollView 예시
final class VC3: UIViewController {
    let indices = (0...100).map(String.init)
    
    // 1.
    private let container = UIView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = .fullScreen
        view.backgroundColor = .white
        
        let labels = indices.map { i in
            let label = UILabel()
            label.text = i
            label.textColor = .black
            label.font = .systemFont(ofSize: 20)
            return label
        }
        
        // 2.
        view.addSubview(container)
        container.addSubview(scrollView)
        container.addSubview(button)
        scrollView.addSubview(contentView)
        
        contentView.flex.define { flex in
            labels.forEach { label in
                flex.addItem(label)
                    .marginHorizontal(20)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 3.
        container.pin.all()
        
        button.pin.horizontally().bottom(view.pin.safeArea).height(50)
        scrollView.pin.above(of: button).top().horizontally()
        
        contentView.pin.top().horizontally()
        contentView.flex.layout(mode: .adjustHeight)
        
        scrollView.contentSize = contentView.frame.size
    }
}
