//
//  CountriesView.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import UIKit

class CountriesView: UIView {

	let label = UILabel()
	
	let margin = CGFloat(16)
	
	init() {
		
		super.init(frame: .zero)
		
		configView()
		configLabel()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	var text: String = "" {
		
		didSet {
			
			label.text = text
		}
	}
	
	func configView() {
		
		layer.cornerRadius 		= CGFloat(10)
		layer.borderWidth		= CGFloat(2)
		layer.borderColor		= UIColor.systemBlue.cgColor
	}
	
	func configLabel() {
		
		label.font 				= UIFont.preferredFont(forTextStyle: .title2)
		label.textColor 		= .label
		label.text				= self.text
		label.numberOfLines 	= 0
		label.setContentHuggingPriority(UILayoutPriority(200), for: .vertical)
		
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		
		NSLayoutConstraint.activate([
		
			label.topAnchor.constraint(equalTo: self.topAnchor, constant: margin),
			label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
			label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin),
			label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin),
		])
	}

}
