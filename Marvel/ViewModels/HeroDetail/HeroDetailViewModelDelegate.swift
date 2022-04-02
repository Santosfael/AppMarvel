//
//  HeroDetailViewModelDelegate.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 02/04/22.
//

import Foundation
import UIKit

protocol HeroDetailViewModelDelegate: AnyObject {
    
    func heroUpdated(result: ResultHero)
    
}
