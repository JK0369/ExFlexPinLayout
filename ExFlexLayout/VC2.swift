//
//  VC2.swift
//  ExFlexLayout
//
//  Created by 김종권 on 2023/03/06.
//

import UIKit
import PinLayout
import FlexLayout

// TableView 예시
final class VC2: UIViewController {
    private let items = (0...50).map(String.init)
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.allowsSelection = false
        view.backgroundColor = .clear
        view.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        view.estimatedRowHeight = 34
        return view
    }()
    
    override func viewDidLoad() {
        modalPresentationStyle = .fullScreen
        view.backgroundColor = .white
        
        view.flex.define { flex in
            flex.addItem(tableView)
        }
        
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.pin.all()
        tableView.flex.layout()
    }
}

extension VC2: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as? MyTableViewCell
        else { return UITableViewCell() }
        cell.prepare(text: items[indexPath.row])
        return cell
    }
}

final class MyTableViewCell: UITableViewCell {
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.flex.define { flex in
            flex.addItem(label)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        contentView.pin.width(size.width)
        contentView.flex.layout()
        return contentView.frame.size
    }
    
    func prepare(text: String) {
        label.text = text
    }
}



