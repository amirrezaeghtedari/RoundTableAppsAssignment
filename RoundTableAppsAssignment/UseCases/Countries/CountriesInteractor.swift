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
				
				self.delegate?.interactor(self, didUpdate: Result.failure(error))
				
			case .success(let countriesResponse):
				
				self.countries = countriesResponse.map { country -> Country in
					return Country(name: country.name, isSelected: false)
				}
				
				self.delegate?.interactor(self, didUpdate: Result.success(self.countries!))
			}
		}
	}
	
	func toggleCountry(countryName name: String) {
		
		guard let countries = countries else { return }
		
		for (index, country) in countries.enumerated() {
			
			if country.name == name {
				
				self.countries![index].isSelected = !self.countries![index].isSelected
				delegate?.interactor(self, didUpdate: Result.success(self.countries!))
				break
			}
		}
	}
	
	func getSelectedCountries() -> [Country] {
		
		guard let countries = self.countries else {
			
			return [Country]()
		}
		
		return countries.filter { country -> Bool in
			
			return country.isSelected
		}
	}
}
