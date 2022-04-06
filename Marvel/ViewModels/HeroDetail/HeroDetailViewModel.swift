//
//  HeroDetailViewModel.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 02/04/22.
//

import Foundation

class HeroDetailViewModel {
    
    private var hero: ResultHero?
    
    var delegate: HeroDetailViewModelDelegate?
    
    init(hero: ResultHero) {
        self.hero = hero
        delegate?.heroUpdated(result: hero)
    }
    
    func updateViewIfNeeded() {
        if let hero = hero {
            delegate?.heroUpdated(result: hero)
        }
    }
    
    func getHero() -> ResultHero? {
        return hero
    }
    
    
}
