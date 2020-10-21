//
//  CountryFetcher.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

class CountriesInteractor: CountriesInteractorInterface {
	
	var delegate: CountriesInteractorDelegate?
	var countries: [Country]?
	
	let countriesProvider: CountriesProviderInterface
	
	init(countriesProvider: CountriesProviderInterface) {
		
		self.countriesProvider = countriesProvider
	}
	
	func fetchCountries() {
		
		countriesProvider.fetchCountries {[weak self] result in
			
			guard let self = self else { return }
			switch result {
			
			case .failure(let error):
				
				self.delegate?.interactor(self, didFetch: Result.failure(error))
				
			case .success(let countriesResponse):
				
				self.countries = countriesResponse.map { country -> Country in
					return Country(name: country.name, isSelected: false)
				}
				
				self.delegate?.interactor(self, didFetch: Result.success(self.countries!))
			}
		}
	}
	
	func toggleCountry(countryName name: String) {
		
		guard let countries = countries else { return }
		
		for (index, country) in countries.enumerated() {
			
			if country.name == name {
				
				self.countries![index].isSelected = true
				delegate?.interactor(self, didToggle: self.countries![index])
				break
			}
		}
	}
}
