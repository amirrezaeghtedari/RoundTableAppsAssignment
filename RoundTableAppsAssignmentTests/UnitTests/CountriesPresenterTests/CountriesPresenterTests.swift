//
//  CountriesPresenterTests.swift
//  RoundTableAppsAssignmentTests
//
//  Created by Amirreza Eghtedari on 8/2/1399 AP.
//

import XCTest
@testable import RoundTableAppsAssignment

class CountriesPresenterTests: XCTestCase {

	var sut: CountriesPresenter!
	
	let sutDelegate 			= CountriesPresenterDelegateMock()
	let countriesInteractor 	= CountriesInteractorMock()
	
    override func setUpWithError() throws {
		
		sut 			= CountriesPresenter()
		sut.delegate 	= sutDelegate
    }

    override func tearDownWithError() throws {
        
    }

    func test_didFetch_success() throws {
		
		let c1 = Country(name: "c1", isSelected: false)
		let c2 = Country(name: "c2", isSelected: false)
		let countries = [c1, c2]
		
		let countryViewModels = countries.map() { country in
			
			return CountryViewModel(name: country.name, actionLabelTitle: "Add", actionLabelColor: .blue)
		}
		
		let exp = expectation(description: "DidFetch Success")
		
		sutDelegate.didFetchCompletion = { result in
			
			if case let Result.success(receivedCounryViewModels) = result,  receivedCounryViewModels == countryViewModels {
				
				exp.fulfill()
			}
		}
		
		sut.interactor(countriesInteractor, didFetch: Result.success(countries))
		
		waitForExpectations(timeout: 1, handler: nil)
    }
}
