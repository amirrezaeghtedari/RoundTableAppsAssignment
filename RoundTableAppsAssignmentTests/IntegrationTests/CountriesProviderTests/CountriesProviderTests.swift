//
//  CountriesProviderTests.swift
//  RoundTableAppsAssignmentTests
//
//  Created by Amirreza Eghtedari on 8/2/1399 AP.
//

import XCTest
@testable import RoundTableAppsAssignment

class CountriesProviderTests: XCTestCase {

	var sut: CountriesProvider!
	
    override func setUpWithError() throws {

		//Setup URLSession with a fake underlaying protocol
		let configuration = URLSessionConfiguration.ephemeral
		configuration.protocolClasses = [MockURLProtocol.self]
		let urlSession = URLSession(configuration: configuration)
		
		sut = CountriesProvider(session: urlSession)
    }

    override func tearDownWithError() throws {

    }

    func test_fetchCountries_success() throws {
        
		MockURLProtocol.requestHandler = { urlRequest in
			let sampleResponse = CounriesSampleResponse().response.data(using: .utf8)
			return (HTTPURLResponse(), sampleResponse!)
		}
		
		let exp = expectation(description: "Fetch Countries Expectation")
		
		sut.fetchCountries { result in
			
			if case let Result.success(successResult) = result,
			   !successResult.isEmpty {
				
				for i in successResult {
					print(i.name)
				}
				exp.fulfill()
			}
		}
		
		waitForExpectations(timeout: 1, handler: nil)
    }
	
	

}
