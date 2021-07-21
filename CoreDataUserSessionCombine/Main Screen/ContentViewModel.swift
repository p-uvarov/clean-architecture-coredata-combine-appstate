//
//  ContentViewModel.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import Foundation

protocol OnboardingResponder {
	func setOnboardingRoute()
}

protocol SignedInResponder {
	func setSignedInRoute(with user: User)
}

class ContentViewModel: ObservableObject, OnboardingResponder, SignedInResponder {
	// MARK: - Properties
	@Published public private(set) var viewRoute: ContentViewRoute = .launch

	// MARK: - Methods
	func setOnboardingRoute() {
		UserSession.shared.user = nil
		viewRoute = .onboarding
	}
	
	func setSignedInRoute(with user: User) {
		UserSession.shared.user = user
		viewRoute = .signedIn
	}
}
