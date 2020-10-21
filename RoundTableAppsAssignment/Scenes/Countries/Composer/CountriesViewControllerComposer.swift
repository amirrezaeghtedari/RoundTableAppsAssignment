//
//  CountriesComposer.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

class CountriesViewControllerComposer {
	
	func makeModule() -> CountriesViewControllerInterface {
		
		let countriesProvider       = CountriesProvider(session: URLSession.shared)
		let interactor 				= CountriesInteractor(countriesProvider: countriesProvider)
		let presenter 				= CountriesPresenter()
		
		let viewController 	= CountriesViewController(interactor: interactor)
		interactor.delegate = presenter
		presenter.delegate 	= viewController
		
		return viewController
	}
}
