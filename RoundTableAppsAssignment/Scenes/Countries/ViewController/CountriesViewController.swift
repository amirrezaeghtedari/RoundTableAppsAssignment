//
//  CountriesViewController.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import UIKit

class CountriesViewController: UIViewController, CountriesViewControllerInterface {
	
	enum SectionType {
		case main
	}
	
	var dataSource: UITableViewDiffableDataSource<SectionType, CountryViewModel>!
	
	weak var delegate: CountriesViewControllerDelgate?
	var interactor: CountriesInteractorInterface
	
	let actionButton 		= ActionButton()
	let tableView			= UITableView()
	
	let hMargin 		= CGFloat(24)
	let vMargin			= CGFloat(24)
	
	init(interactor: CountriesInteractorInterface) {
		
		self.interactor = interactor
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		
		configViewController()
		configSearchBar()
        cofingActionButton()
		configTableView()
		configDataSource()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		
		interactor.fetchCountries()
		tableView.backgroundView = LoadingView()
	}
	
	private func configViewController() {
		
		title 					= Strings.selectCountries
		view.backgroundColor 	= .secondarySystemBackground
	}
	
	private func configSearchBar() {
		
		let searchController 					= UISearchController()
		searchController.searchResultsUpdater 	= self
		searchController.delegate 				= self
		searchController.searchBar.searchTextField.returnKeyType = .done
		navigationItem.searchController 		= searchController
		searchController.obscuresBackgroundDuringPresentation = false
	}
	
	private func configTableView() {
		
		tableView.backgroundColor 	= .systemBackground
		tableView.tableFooterView 	= UIView()
		tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.reuseIdentifier)
		tableView.delegate 			= self
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(tableView)
		
		NSLayoutConstraint.activate([
		
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -vMargin)
		])
	}
	
	private func cofingActionButton() {
		
		actionButton.setTitle(Strings.done, for: .normal)
		actionButton.addTarget(self, action: #selector(actionButtonDidTap(button:)), for: .touchUpInside)
		
		actionButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(actionButton)
		
		NSLayoutConstraint.activate([
		
			actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -vMargin),
			actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: vMargin),
			actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -vMargin),
			actionButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}
	
	@objc
	private func actionButtonDidTap(button: UIButton) {
		
		delegate?.viewController(self, didSelect: interactor.getSelectedCountries())
		
		navigationItem.searchController?.dismiss(animated: false, completion: nil)
		self.dismiss(animated: true, completion: nil)
	}
	
	private func configDataSource() {
		
		dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, countryViewModel) -> UITableViewCell? in
			
			guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.reuseIdentifier) as? CountryTableViewCell else {
				
				return UITableViewCell()
			}
			
			cell.set(viewModel: countryViewModel)
			
			return cell
		})
		
		dataSource.defaultRowAnimation = .fade
	}
	
	private func show(_ countries: [CountryViewModel]) {
		
		DispatchQueue.main.async {
			
			if !countries.isEmpty {
				
				self.tableView.backgroundView = UIView()
			}
			
			var snapshot = NSDiffableDataSourceSnapshot<SectionType, CountryViewModel>()
			snapshot.appendSections([SectionType.main])
			snapshot.appendItems(countries)

			self.dataSource.apply(snapshot)
			
			if countries.isEmpty {
				
				self.tableView.backgroundView = EmptyStateView(title: "No matching search result!")
			}
		}
	}
	
	fileprivate func show(_ error: CountriesError) {
		
		DispatchQueue.main.async {
			
			self.tableView.backgroundView = EmptyStateView(title: error.localizedDescription)
		}
	}
}

extension CountriesViewController: CountriesPresenterDelegate {
	
	func presenter(_ presenter: CountriesPresenterInterface, didFetch result: Result<[CountryViewModel], CountriesError>) {
		
		switch result {
		
		case .failure(let error):
			
			show(error)
			
		case .success(let countries):
			
			show(countries)
		}
	}
	
	func presenter(_ presenter: CountriesPresenterInterface, didUpdate countries: [CountryViewModel]) {
		
		show(countries)
	}

}

extension CountriesViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		guard let countryViewModel = dataSource.itemIdentifier(for: indexPath) else { return }
	
		interactor.toggleCountry(countryName: countryViewModel.name)
	}
}

extension CountriesViewController: UISearchResultsUpdating {
	
	func updateSearchResults(for searchController: UISearchController) {
		
		guard let filter = searchController.searchBar.text, !filter.isEmpty else {
			
			interactor.cancelCountriesFilter()
			return
		}

		interactor.filterCountries(with: filter)
	}
}

extension CountriesViewController: UISearchControllerDelegate {
	
	func didDismissSearchController(_ searchController: UISearchController) {
		
	}
}
