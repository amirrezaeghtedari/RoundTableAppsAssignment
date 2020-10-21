//
//  CountriesProviderInterface.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/29/1399 AP.
//

import Foundation

protocol CountriesProviderInterface {
	
	func fetchCountries(completion: @escaping (Result<CountriesResponseModel, Error>) -> Void)
}
