//
//  CountriesPresenter.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

class CountriesPresenter: CountriesInteractorDelegate {
	
	var delegate: CountriesPresenterDelegate?
	
	func interactor(_: CountriesInteractorInterface, result: Result<[Country], Error>) {
		
		switch result {
		case .failure(let error):
			break
			
		case .success(let countries):
			
			print(countries)
		}
	}
}
