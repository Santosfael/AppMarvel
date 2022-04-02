//
//  HeroCollectionView.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 01/04/22.
//

import UIKit

class HeroCollectionView: UIView {
    
//    lazy var collectionTableView: UICollectionView = {
//        //let flowLayout = UICollectionViewFlowLayout()
//        let collection = UICollectionView(frame: .zero)
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        return collection
//    }()
//
//    let view: CGSize?
//
//    init(view: CGSize) {
//        self.view = view
//        super.init(frame: .zero)
//        self.setupView()
//
//
//    }
//
//    private func setupView() {
//        //collectionTableView.reloadData()
//
//        addSubview(collectionTableView)
//        //collectionLayout()
//        constraints()
//        registerCell()
//        collectionLayout()
//        collectionTableView.dataSource = self
//
//    }
//
//    private func registerCell() {
//        collectionTableView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
//    }
//
//    func collectionLayout() {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 120, height: 200)
//        layout.minimumLineSpacing = 10
//        layout.scrollDirection = .vertical
//        collectionTableView.collectionViewLayout = layout
//        //return layout
//    }
//
//    private func constraints() {
//        NSLayoutConstraint.activate([
//            collectionTableView.topAnchor.constraint(equalTo: topAnchor),
//            collectionTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            collectionTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            collectionTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
//
//extension HeroCollectionView: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
////        cell.contentView.backgroundColor = .red
//        return cell
//
//    }
    
    
}

