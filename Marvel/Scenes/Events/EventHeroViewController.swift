//
//  EventHeroViewController.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 02/04/22.
//

import UIKit

class EventHeroViewController: UIViewController {
    
    var data = ["Primeiro","Segundo","Terceiro","Quarto","Quinto"]
    
    var viewModel: HeroEventViewModel?

    lazy var heroImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var eventsHeroTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .black
        table.separatorColor = .red
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(heroImage)
        view.addSubview(eventsHeroTableView)
        delegates()
        
        viewModel?.updateViewIfNeeded()
        constraints()
        registerCell()
    }
    
    func delegates() {
        eventsHeroTableView.delegate = self
        eventsHeroTableView.dataSource = self
        viewModel?.delegate = self
        
    }
    
    func registerCell() {
        eventsHeroTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func constraints() {
        
        NSLayoutConstraint.activate([
            heroImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            heroImage.heightAnchor.constraint(equalToConstant: 195),
            heroImage.widthAnchor.constraint(equalToConstant: 195),
            heroImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //table
        NSLayoutConstraint.activate([
            eventsHeroTableView.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 10),
            eventsHeroTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventsHeroTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eventsHeroTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

extension EventHeroViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.eventCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .black
        cell.textLabel?.text = viewModel?.getNameEvent(by: indexPath.row)
        cell.textLabel?.textColor = .white
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.6366813397, green: 0.1702153683, blue: 0.2569398284, alpha: 1)
        cell.selectedBackgroundView = bgColorView
        return cell
    }
}

extension EventHeroViewController: HeroEventViewModelDelegate {
    func heroUpdated(result: ResultHero) {
        guard let image = result.thumbnail?.path,
              let ext = result.thumbnail?.thumbnailExtension else { return }

        guard let url = URL(string: "\(image).\(ext)") else { return }
        title = "Events"
        heroImage.kf.setImage(with: url)
        eventsHeroTableView.reloadData()
    }
    
    
}
