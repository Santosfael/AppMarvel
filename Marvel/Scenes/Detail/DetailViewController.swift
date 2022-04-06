//
//  DetailViewController.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 02/04/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: HeroDetailViewModel?
    
    lazy var heroImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "applelogo")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    lazy var eventButton: CustomUIButton = {
        let button = CustomUIButton()
        button.setTitle("Veja mais eventos", for: .normal)
        button.addTarget(self, action: #selector(heroEvent), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        viewModel?.delegate = self
        setupView()
        viewModel?.updateViewIfNeeded()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        view.addSubview(heroImage)
        view.addSubview(descriptionLabel)
        view.addSubview(eventButton)
        constrainsts()
    }
    
    @objc private func heroEvent() {
        guard let hero = viewModel?.getHero() else { return }
        
        let detailViewModel = HeroEventViewModel(hero: hero)
        let eventHeroViewController = EventHeroViewController()
        eventHeroViewController.viewModel = detailViewModel
        navigationController?.pushViewController(eventHeroViewController, animated: true)
    }
    
    private func constrainsts() {
        //Image
        NSLayoutConstraint.activate([
            heroImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            heroImage.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            heroImage.heightAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            heroImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //Description
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        //Button
        NSLayoutConstraint.activate([
            eventButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            eventButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            eventButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            eventButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

}

extension DetailViewController: HeroDetailViewModelDelegate {
    func heroUpdated(result: ResultHero) {
        guard let image = result.thumbnail?.path,
              let ext = result.thumbnail?.thumbnailExtension,
              let nameHero = result.name else { return }
        
        guard let url = URL(string: "\(image).\(ext)") else { return }
        
        title = nameHero
        heroImage.kf.setImage(with: url)
        if result.resultDescription == "" {
            descriptionLabel.text = "No description"
        } else {
            descriptionLabel.text = result.resultDescription
        }
        
    }
}
