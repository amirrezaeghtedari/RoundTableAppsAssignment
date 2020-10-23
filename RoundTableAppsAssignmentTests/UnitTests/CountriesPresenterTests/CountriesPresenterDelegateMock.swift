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
	
	var didFetchCompletion: DidFetchCompletion?
	var didUpdateCompletion: DidUpdateCompletion?
	
	func presenter(_ presenter: CountriesPresenterInterface, didFetch result: Result<[CountryViewModel], CountriesError>) {
		
		didFetchCompletion?(result)
	}
	
	func presenter(_ presenter: CountriesPresenterInterface, didUpdate countries: [CountryViewModel]) {
		
		didUpdateCompletion?(countries)
	}
	
	
}
