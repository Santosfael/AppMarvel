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
    //let heroCollectionTableView = HeroCollectionView(view: self.view)
    
    override func loadView() {
        let heroCollectionTableView = HeroCollectionView(view: CGSize(width: 120, height: 200))
        self.view = heroCollectionTableView
        heroCollectionTableView.collectionTableView.delegate = self
    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewModel?.delegate = self
        configView()
	
		state = .loading
        
        navigationControllerSetup()
		
		fetchHero()
	}
    
    private func configView() {
        title = "Heros"
        navigationControllerSetup()
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
        
        searchController.searchBar.delegate = self
        
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
    }
	
	private func fetchHero() {
		viewModel?.fetchHero()
	}
	
	private func setupView() {
		
		switch state {
		case .loading:
			print("loading")
		case .normal:
			print("normal")
			print(viewModel?.hero?.data?.results?[0].name ?? "")
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
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
