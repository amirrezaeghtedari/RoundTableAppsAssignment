//
//  CountriesInterctoreDelegateMock.swift
//  RoundTableAppsAssignmentTests
//
//  Created by Amirreza Eghtedari on 8/2/1399 AP.
//

import Foundation
@testable import RoundTableAppsAssignment

class CountriesInteractoreDelegateMock: CountriesInteractorDelegate {
	
	typealias DidFetchCompletion 	= (Result<[Country], CountriesError>) -> Void
	typealias DidUpdateCompletion 	= ([Country]) -> Void
	
	var didFetchCompletion: DidFetchCompletion?
	var didUpdateCompeltion: DidUpdateCompletion?

	
	func interactor(_ interactor: CountriesInteractorInterface, didFetch result: Result<[Country], CountriesError>) {
		
		didFetchCompletion?(result)
	}
	
	func interactor(_ interactor: CountriesInteractorInterface, didUpdate countries: [Country]) {
		
		didUpdateCompeltion?(countries)
	}
	
	
}
