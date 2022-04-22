//
//  HeroListServiceProtocol.swift
//  Marvel
//
//  Created by Douglas Nunes on 30/03/22.
//

import Foundation

enum HeroError: Error {
	case error(String)
	case urlInvalid
	case noDataAvailable
	case noProcessData
}

protocol HeroListServiceProtocol: AnyObject {
	/// handler -> Objeto generico, que tem 2 casos, que é o de sucesso e o de falha
    func execute(searchHero: String?, handler: @escaping(Result<Hero, HeroError>) -> Void)
	
}
