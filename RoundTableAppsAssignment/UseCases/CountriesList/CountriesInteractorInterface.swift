//
//  CountriesInteractorInterface.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

protocol CountriesInteractorInterface {
	
	func fetchCountries()
	func toggleCountry(countryName name: String)
	func getSelectedCountries() -> [Country]
	func filterCountries(with filter: String)
	func cancelCountriesFilter()
}
