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
	var filteredCountries: [Country]?
	
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

		for country in countries {

			if country.name == name {

				country.isSelected = !country.isSelected
				break
			}
		}
		
		
		if let filteredCountries = self.filteredCountries {

			   delegate?.interactor(self, didUpdate: filteredCountries)

		   } else {

			   delegate?.interactor(self, didUpdate: countries)
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
	
	func filterCountries(with filter: String) {
		
		guard let countries = self.countries else { return }
	
		guard !filter.isEmpty else {
			
			filteredCountries = nil
			
			if let countries = self.countries {
				
				delegate?.interactor(self, didUpdate: countries)
			}
		
			return
		}
		
		filteredCountries = countries.filter() { country in
			
			return country.name.contains(filter)
		}
		
		if let filteredCountries = filteredCountries {
			
			delegate?.interactor(self, didUpdate: filteredCountries)
		
		} else {
			
			delegate?.interactor(self, didUpdate: [Country]())
		}

	}
	
	func cancelCountriesFilter() {
		
		self.filteredCountries = nil
		
		guard let countries = self.countries else {
			
			delegate?.interactor(self, didUpdate: [Country]())
			return
		}
		
		delegate?.interactor(self, didUpdate: countries)
	}
}
