//
//  CustomCollectionViewCell.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 01/04/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configView()
    }
    
    private func configView() {
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
