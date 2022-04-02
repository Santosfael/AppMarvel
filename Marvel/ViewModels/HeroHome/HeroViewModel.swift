//
//  HeroViewModel.swift
//  Marvel
//
//  Created by Douglas Nunes on 31/03/22.
//

import Foundation

class HeroViewModel {
	
	private var services: HeroListServiceProtocol
    
    var countHero: Int {
        return hero?.data?.results?.count ?? 0
    }
	
	weak var delegate: HeroViewModelDelegate?
	
	private var hero: Hero?
	
	init(services: HeroListServiceProtocol) {
		self.services = services
	}
	
    func fetchHero(search: String? = nil) {
		
        services.execute(searchHero: search) { result in
			
			switch result {
			case .success(let hero):
				self.sucess(hero: hero)
			case .failure(let error):
				self.error(error: error.localizedDescription)
			}
		}
	}
	
	private func sucess(hero: Hero) {
		self.hero = hero
		delegate?.heroFetchWithSucess()
	}
	
	private func error(error: String) {
		delegate?.errorToFetchHero(error)
	}
    
    func dataHero(by index: Int) -> ResultHero? {
        return hero?.data?.results?[index]
    }
}
