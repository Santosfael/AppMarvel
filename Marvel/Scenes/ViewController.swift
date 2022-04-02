//
//  ViewController.swift
//  Marvel
//
//  Created by Douglas Nunes on 30/03/22.
//

import UIKit

class ViewController: UIViewController {
    

	fileprivate enum ViewState {
	  case loading
	  case normal
	  case error
	}
	
	fileprivate var state: ViewState = .normal {
	  didSet {
		self.setupView()
	  }
	}
	
	internal var viewModel: HeroViewModel?
    
    //Começamos aqui
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var collectionTableView: UICollectionView = {
        let flowLayout = collectionLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewModel?.delegate = self
        setupHero()
        view.backgroundColor = .systemBackground
	
		state = .loading
        
        navigationControllerSetup()
		
		fetchHero()
	}
    
    private func setupHero() {
        title = "Heros"
        navigationControllerSetup()
        view.addSubview(collectionTableView)
//
        constraints()
        registerCell()
        collectionTableView.dataSource = self
        collectionTableView.delegate = self
    }
    
    private func navigationControllerSetup() {
        navigationItem.searchController = searchController
        self.definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        self.searchBarControllerSetup()
    }
    
    private func searchBarControllerSetup() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Pesquisar heroi"
        definesPresentationContext = true
        searchController.loadViewIfNeeded()
        searchController.searchBar.autocapitalizationType = .none
        
        searchController.searchBar.delegate = self
        
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
    private func registerCell() {
        collectionTableView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
    
    private func collectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.size.width / 2) - 30, height: 200)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        return layout
    }
    
    private func constraints() {
        NSLayoutConstraint.activate([
            collectionTableView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
	
	private func fetchHero() {
		viewModel?.fetchHero()
	}
	
	private func setupView() {
		
		switch state {
		case .loading:
			print("loading")
		case .normal:
            DispatchQueue.main.async {
                self.collectionTableView.reloadData()
            }
		case .error:
			print("error")
		}
		
	}
}

extension ViewController: HeroViewModelDelegate {
	func heroFetchWithSucess() {
		state = .normal
	}
	
	func errorToFetchHero(_ error: String) {
		
		print(error)
		state = .error
	}
}

extension ViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        viewModel?.fetchHero(search: searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.fetchHero()
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let hero = viewModel?.dataHero(by: indexPath.row) else {
            return
        }
        let detailViewModel = HeroDetailViewModel(hero: hero)
        let heroDetailViewController = DetailViewController()
        heroDetailViewController.viewModel = detailViewModel
        navigationController?.pushViewController(heroDetailViewController, animated: true)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.countHero ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        if let dataHero = viewModel?.dataHero(by: indexPath.row) {
            cell.dataCell(with: dataHero)
        }
        
        return cell
        
    }
    
    
}

