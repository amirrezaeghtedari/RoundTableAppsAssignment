//
//  CountryFetcher.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

class CountriesInteractor: CountriesInteractorInterface {
	
	var delegate: CountriesInteractorDelegate?
	
	let countriesProvider: CountriesProviderInterface
	
	init(countriesProvider: CountriesProviderInterface) {
		
		self.countriesProvider = countriesProvider
	}
	
	func fetchCountries() {
		
		countriesProvider.fetchCountries { result in
			
		}
	}
}
