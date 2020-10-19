//
//  CountriesNavigationControllerComposer.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/28/1399 AP.
//

import UIKit

class CountriesNavigationControllerComposer {
	
	func makeModule() -> UINavigationController {
		
		let vc = CountriesViewControllerComposer().makeModule()
		let nc = UINavigationController()
		nc.modalPresentationStyle = .fullScreen
		
		nc.viewControllers = [vc]
		
		return nc
	}
}
