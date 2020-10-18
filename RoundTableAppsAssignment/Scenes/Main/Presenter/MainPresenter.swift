//
//  MainPresenter.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

class MainPresenter: SelectedCountriesInteractorDelegate {
	
	weak var delegate: MainPresenterDelegate?
	
	func interactor(_: SelectedCountriesInteractor, didSelectCountries countries: [Country]) {
		
		let countryViewModels = countries.map { country in
			MainCountryViewModel(name: country.name)
		}
		
		delegate?.presenter(self, didSelectCountries: countryViewModels)
	}

}
