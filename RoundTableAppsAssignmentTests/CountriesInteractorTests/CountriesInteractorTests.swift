//
//  RoundTableAppsAssignmentTests.swift
//  RoundTableAppsAssignmentTests
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import XCTest
@testable import RoundTableAppsAssignment

class CountriesInteractorTests: XCTestCase {
	
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {

    }

    func test_fetch_success() throws {
        
		let c1 = CountriesResponseModel(name: "c1")
		let c2 = CountriesResponseModel(name: "c2")
		let successCountriesResponse = [c1, c2]
		let successCountries = successCountriesResponse.map { countryResponse in
			return Country(name: countryResponse.name, isSelected: false)
		}
		
		let countriesProvider = CountriesProviderMock(result: Result.success(successCountriesResponse))
		
		//stu: System Under Test
		let sut = CountriesInteractor(countriesProvider: countriesProvider)
		
		let exp = expectation(description: "Fetch Counties")
		
		let delegate = CountriesInteractoreDelegateMock()
		delegate.didFetchCompletion = { result in
			
			if case let Result.success(countries) = result {
				
				if countries == successCountries {
					exp.fulfill()
				}
			}
		}
		
		sut.delegate = delegate
		sut.fetchCountries()
		
		waitForExpectations(timeout: 1, handler: nil)
    }
	
	func test_fetch_failInternetConnectionError() {
		
		let countriesProvider = CountriesProviderMock(result: Result.failure(CountriesError.internetConnectionError))
		
		let sut = CountriesInteractor(countriesProvider: countriesProvider)
		
		let exp = expectation(description: "Fetch Counties Fail")
		
		let delegate = CountriesInteractoreDelegateMock()
		delegate.didFetchCompletion = { result in
			
			if case let Result.failure(error) = result {
				
				if error == CountriesError.internetConnectionError {
					exp.fulfill()
				}
			}
		}
		
		sut.delegate = delegate
		sut.fetchCountries()
		
		waitForExpectations(timeout: 1, handler: nil)
	}
	
	func test_toggleCountry_success() {
		
		let c1 = CountriesResponseModel(name: "c1")
		let c2 = CountriesResponseModel(name: "c2")
		let successCountriesResponse = [c1, c2]
		
		let countriesProvider = CountriesProviderMock(result: Result.success(successCountriesResponse))
		
		//stu: System Under Test
		let sut = CountriesInteractor(countriesProvider: countriesProvider)
		
		let exp = expectation(description: "Fetch Counties")
		exp.expectedFulfillmentCount = 2
		
		let delegate = CountriesInteractoreDelegateMock()
		sut.delegate = delegate
		sut.fetchCountries()
		
		delegate.didUpdateCompeltion = { countries in

			if countries[0].isSelected {
				
				exp.fulfill()
			}
		}
		
		sut.toggleCountry(countryName: "c1")
		
		delegate.didUpdateCompeltion = { countries in
			
			if !countries[0].isSelected {
				
				exp.fulfill()
			}
		}
		
		sut.toggleCountry(countryName: "c1")
		
		waitForExpectations(timeout: 1, handler: nil)
	}
	
	func test_filterCountriesAndCancelFilter_success() {
		
		let c1 = CountriesResponseModel(name: "c1")
		let c2 = CountriesResponseModel(name: "c2")
		let successCountriesResponse = [c1, c2]
		
		let countriesProvider = CountriesProviderMock(result: Result.success(successCountriesResponse))
		
		//stu: System Under Test
		let sut = CountriesInteractor(countriesProvider: countriesProvider)
		
		let exp = expectation(description: "Fetch Counties")
		exp.expectedFulfillmentCount = 2
		
		let delegate = CountriesInteractoreDelegateMock()
		
		
		sut.delegate = delegate
		sut.fetchCountries()
		
		delegate.didUpdateCompeltion = { countries in
			
			if countries.count == 1 && countries[0].name == "c1" {
				
				exp.fulfill()
			}
		}
		
		sut.filterCountries(with: "c1")
		
		delegate.didUpdateCompeltion = { countries in
			
			if countries.count == 2 {
				
				exp.fulfill()
			}
		}
		
		sut.cancelCountriesFilter()
		
		waitForExpectations(timeout: 1, handler: nil)
	}
	
	func test_getSelectedCountries_success() {
		
		let c1 = CountriesResponseModel(name: "c1")
		let c2 = CountriesResponseModel(name: "c2")
		let successCountriesResponse = [c1, c2]
		
		let countriesProvider = CountriesProviderMock(result: Result.success(successCountriesResponse))
		
		//stu: System Under Test
		let sut = CountriesInteractor(countriesProvider: countriesProvider)
		
		sut.fetchCountries()
		sut.toggleCountry(countryName: "c1")
		let selectedCountries = sut.getSelectedCountries()
		
		XCTAssert(selectedCountries.count == 1)
		XCTAssert(selectedCountries[0].name == "c1")
	}

}
