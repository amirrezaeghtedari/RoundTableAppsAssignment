//
//  CountriesComposer.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

class CountriesComposer {
	
	func makeModule() -> CountriesViewControllerInterface {
		
		let interactor 		= CountriesInteractor()
		let presenter 		= CountriesPresenter()
		
		let viewController 	= CountriesViewController(interactor: interactor)
		interactor.delegate = presenter
		presenter.delegate 	= viewController
		
		return viewController
	}
}
