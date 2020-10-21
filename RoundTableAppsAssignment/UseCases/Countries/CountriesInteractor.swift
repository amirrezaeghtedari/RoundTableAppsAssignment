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
		
		countriesProvider.fetchCountries {[weak self] result in
			
			guard let self = self else { return }
			switch result {
			
			case .failure(let error):
				
				self.delegate?.interactor(self, result: Result.failure(error))
				
			case .success(let countriesResponse):
				
				let countries = countriesResponse.map { country -> Country in
					return Country(name: country.name, isSelected: false)
				}
				
				self.delegate?.interactor(self, result: Result.success(countries))
			}
		}
	}
}
