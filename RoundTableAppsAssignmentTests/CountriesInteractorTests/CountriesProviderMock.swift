//
//  CountriesProviderMock.swift
//  RoundTableAppsAssignmentTests
//
//  Created by Amirreza Eghtedari on 8/2/1399 AP.
//

import Foundation
@testable import RoundTableAppsAssignment

class CountriesProviderMock: CountriesProviderInterface {
	
	let result: Result<[CountriesResponseModel], CountriesError>
	
	init(result: Result<[CountriesResponseModel], CountriesError>) {
	
		self.result = result
	}
	
	func fetchCountries(completion: @escaping (Result<[CountriesResponseModel], CountriesError>) -> Void) {
		
		completion(result)
	}

}
