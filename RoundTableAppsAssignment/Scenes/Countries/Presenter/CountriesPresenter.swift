//
//  CountriesPresenter.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

class CountriesPresenter: CountriesInteractorDelegate {
	
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

extension CountriesPresenter: CountriesPresenterInterface {
	
	func interactor(_: CountriesInteractorInterface, didUpdate result: Result<[Country], Error>) {
		
		switch result {
		
		case .failure(let error):
			
			delegate?.presenter(self, didUpdate: Result.failure(error))
			
		case .success(let countries):
			
			let countryViewModels = countries.map { country in
				
				return mapCountryToCountryViewModel(country)
			}
			
			delegate?.presenter(self, didUpdate: Result.success(countryViewModels))
		}
	}

}
