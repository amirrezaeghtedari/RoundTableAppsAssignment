//
//  CountryProvider.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/29/1399 AP.
//

import Foundation

class CountriesProvider: CountriesProviderInterface {
	
	let session: URLSession
	
	init(session: URLSession) {
		
		self.session = session
	}
	
	func fetchCountries(completion: @escaping (Result<[CountriesResponseModel], CountriesError>) -> Void) {
		
		guard let url = URL(string: NetworkSettings.url) else {
			completion(Result.failure(CountriesError.unknownError))
			return
		}
		
		let task = session.dataTask(with: url) { data, response, error in
			
			guard error == nil else {
				
				if let error = error as NSError?, error.domain == NSURLErrorDomain {
					
					completion(Result.failure(CountriesError.internetConnectionError))
				
				} else {
					
					completion(Result.failure(CountriesError.unknownError))
				}
			
				return
			}
			
			guard let response = response as? HTTPURLResponse else {
				
				completion(Result.failure(CountriesError.unknownError))
				return
			}
			
			guard response.statusCode == 200 else {
				
				completion(Result.failure(CountriesError.unknownError))
				return
			}
			
			guard let data = data else {
				
				completion(Result.failure(CountriesError.unknownError))
				return
			}
			
			do {
				
				let decoder = JSONDecoder()
				let countries = try decoder.decode([CountriesResponseModel].self, from: data)
				
				completion(Result.success(countries))
				
			} catch {
				completion(Result.failure(CountriesError.unknownError))
			}
		}
		
		task.resume()
	}

}
