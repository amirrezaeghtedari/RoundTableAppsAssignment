//
//  CountriesPresenter.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

class CountriesPresenter: CountriesPresenterInterface {
	
	var delegate: CountriesPresenterDelegate?
	
	private func mapCountryToCountryViewModel(_ country: Country) -> CountryViewModel {
		
		let actionLabelTitle: String
		let actionLabelColor: CountrySelectButtonColor
		
		if country.isSelected {
			
			actionLabelTitle 	= Strings.added
			actionLabelColor	= .gray
		
		} else {
			
			actionLabelTitle 	= Strings.add
			actionLabelColor	= .blue
		}
		
		return CountryViewModel(name: country.name,
								actionLabelTitle: actionLabelTitle,
								actionLabelColor: actionLabelColor)
	}

}

extension CountriesPresenter: CountriesInteractorDelegate {
	
	func interactor(_ interactor: CountriesInteractorInterface, didFetch result: Result<[Country], CountriesError>) {
		
		switch result {
		
		case .failure(let error):
			
			delegate?.presenter(self, didFetch: Result.failure(error))
			
		case .success(let countries):
			
			let countryViewModels = countries.map { country in
				
				return mapCountryToCountryViewModel(country)
			}
			
			delegate?.presenter(self, didFetch: Result.success(countryViewModels))
		}
	}
	
	func interactor(_ interactor: CountriesInteractorInterface, didUpdate countries: [Country]) {
		
		let countryViewModels = countries.map() { country in
			return mapCountryToCountryViewModel(country)
		}

		delegate?.presenter(self, didUpdate: countryViewModels)
	}

}
