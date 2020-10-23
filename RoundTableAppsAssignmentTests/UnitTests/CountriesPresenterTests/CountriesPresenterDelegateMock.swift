//
//  CountriesPresenterDelegateMock.swift
//  RoundTableAppsAssignmentTests
//
//  Created by Amirreza Eghtedari on 8/2/1399 AP.
//

import Foundation
@testable import RoundTableAppsAssignment

class CountriesPresenterDelegateMock: CountriesPresenterDelegate {
	
	typealias DidFetchCompletion 	= (Result<[CountryViewModel], CountriesError>) -> Void
	typealias DidUpdateCompletion 	= ([CountryViewModel]) -> Void
	
	var didFetchHandler: DidFetchCompletion?
	var didUpdateHandler: DidUpdateCompletion?
	
	func presenter(_ presenter: CountriesPresenterInterface, didFetch result: Result<[CountryViewModel], CountriesError>) {
		
		didFetchHandler?(result)
	}
	
	func presenter(_ presenter: CountriesPresenterInterface, didUpdate countries: [CountryViewModel]) {
		
		didUpdateHandler?(countries)
	}
	
	
}
