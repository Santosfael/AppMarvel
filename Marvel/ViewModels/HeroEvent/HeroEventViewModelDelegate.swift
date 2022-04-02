//
//  HeroEventViewModelDelegate.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 02/04/22.
//

import Foundation
import UIKit

protocol HeroEventViewModelDelegate: AnyObject {
    
    func heroUpdated(result: ResultHero)
    
}
