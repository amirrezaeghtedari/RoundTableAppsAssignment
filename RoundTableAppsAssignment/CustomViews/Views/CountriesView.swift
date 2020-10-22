//
//  CountriesView.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import UIKit

class CountriesView: UIView {

	let textView = UITextView()
	
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
			
			textView.text = text
		}
	}
	
	func configView() {
		
		backgroundColor 			= .systemBackground
		layer.cornerRadius 			= 15
		layer.borderWidth			= 2
		layer.borderColor			= UIColor.systemBlue.cgColor
		layer.shadowOpacity			= 0.4
		layer.shadowRadius			= 9
		layer.shadowOffset.width	= 0
		layer.shadowOffset.height	= 0
	}
	
	func configLabel() {
		
		textView.font 				= UIFont.preferredFont(forTextStyle: .title2)
		textView.textColor 			= .label
		textView.text				= self.text
		textView.isEditable			= false
		textView.setContentHuggingPriority(UILayoutPriority(200), for: .vertical)
		
		textView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(textView)
		
		NSLayoutConstraint.activate([
		
			textView.topAnchor.constraint(equalTo: self.topAnchor, constant: margin),
			textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
			textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin),
			textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin),
		])
	}

}
