//
//  OnboardingViewModel.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import Foundation

class OnboardingViewModel: ObservableObject {
	// MARK: - Properties
	let signedInResponder: SignedInResponder

	var firstName: String = ""
	var lastName: String = ""
	
	// MARK: - Methods
	init(signedInResponder: SignedInResponder) {
		self.signedInResponder = signedInResponder
	}
	
	func signIn() {
		let user = User(firstName: firstName, lastName: lastName)
		signedInResponder.setSignedInRoute(with: user)
	}
}
