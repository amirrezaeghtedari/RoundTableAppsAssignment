//
//  CountriesInteractorMock.swift
//  RoundTableAppsAssignmentTests
//
//  Created by Amirreza Eghtedari on 8/2/1399 AP.
//

import Foundation
@testable import RoundTableAppsAssignment

class MockCountriesInteractor: CountriesInteractorInterface {
	
	func fetchCountries() {
		//Nothing to do
	}
	
	func toggleCountry(countryName name: String) {
		//Nothing to do
	}
	
	func getSelectedCountries() -> [Country] {
		//Nothing to do
		return [Country]()
	}
	
	func filterCountries(with filter: String) {
		//Nothing to do
	}
	
	func cancelCountriesFilter() {
		//Nothing to do
	}
	
}
