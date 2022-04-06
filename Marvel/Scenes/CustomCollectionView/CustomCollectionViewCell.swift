//
//  CustomCollectionViewCell.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 01/04/22.
//

import UIKit
import Kingfisher

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    lazy var heroImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var nameHeroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.axis = .vertical
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCellView()
    }
    
    private func setupCellView() {
        verticalStack.addArrangedSubview(heroImage)
        verticalStack.addArrangedSubview(nameHeroLabel)
        addSubview(verticalStack)
        constraints()
    }
    
    func dataCell(with model: ResultHero) {
        guard let image = model.thumbnail?.path,
              let ext = model.thumbnail?.thumbnailExtension,
              let nameHero = model.name else { return }
        
        guard let url = URL(string: "\(image).\(ext)") else { return }
        heroImage.kf.setImage(with: url)
        nameHeroLabel.text = nameHero
    }
    
    private func constraints() {
        
        //Image
        NSLayoutConstraint.activate([
            heroImage.heightAnchor.constraint(equalToConstant: 150),
        ])
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
