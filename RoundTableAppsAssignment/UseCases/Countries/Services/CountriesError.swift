//
//  NetworkError.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/30/1399 AP.
//

import Foundation

enum CountriesError: Error {
	
	case internetConnectionError
	case unknownError
}

extension CountriesError: LocalizedError {
	
	var errorDescription: String? {
		
		switch self {
		
		case .internetConnectionError:
			
			return Strings.connectionErrorMessage
		
		case.unknownError:
			
			return Strings.unknownErrorMessage
		}
	}
}
