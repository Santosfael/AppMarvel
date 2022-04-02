//
//  HeroViewModelDelegate.swift
//  Marvel
//
//  Created by Douglas Nunes on 31/03/22.
//

import Foundation
import UIKit

protocol HeroViewModelDelegate: AnyObject {
	
	func heroFetchWithSucess()
	func errorToFetchHero(_ error: String)
	
}
