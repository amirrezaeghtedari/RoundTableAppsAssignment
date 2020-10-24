//
//  CountriesInterctoreDelegateMock.swift
//  RoundTableAppsAssignmentTests
//
//  Created by Amirreza Eghtedari on 8/2/1399 AP.
//

import Foundation
@testable import RoundTableAppsAssignment

class MockCountriesInteractoreDelegate: CountriesInteractorDelegate {
	
	typealias DidFetchCompletion 	= (Result<[Country], CountriesError>) -> Void
	typealias DidUpdateCompletion 	= ([Country]) -> Void
	
	var didFetchHandler: DidFetchCompletion?
	var didUpdateHandler: DidUpdateCompletion?

	
	func interactor(_ interactor: CountriesInteractorInterface, didFetch result: Result<[Country], CountriesError>) {
		
		didFetchHandler?(result)
	}
	
	func interactor(_ interactor: CountriesInteractorInterface, didUpdate countries: [Country]) {
		
		didUpdateHandler?(countries)
	}
	
	
}
