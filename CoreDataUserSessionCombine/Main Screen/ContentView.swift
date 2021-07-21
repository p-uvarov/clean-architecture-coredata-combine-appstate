//
//  ContentView.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Properties
	@StateObject var viewModel: ContentViewModel
	
	// Child Views
	var launchView: LaunchView
	@State var signedInView: SignedInView?
	@State var onboardingView: OnboardingView?
	
	// Factories
	let makeOnboardingView: () -> OnboardingView
	let makeSignedInView: () -> SignedInView
	
	// MARK: - SwiftUI body
    var body: some View {
		VStack {
			switch viewModel.viewRoute {
			case .launch:
				launchView
			case .onboarding:
				onboardingView
			case .signedIn:
				signedInView
			}
		}
		.frame(minWidth: .zero,
			   maxWidth: .infinity,
			   minHeight: .zero,
			   maxHeight: .infinity)
		.onReceive(viewModel.$viewRoute, perform: makeViewIfNeeded)
    }
	
	//MARK: - Methods
	private func makeViewIfNeeded(_ viewRoute: ContentViewRoute) {
		switch viewRoute {
		case .launch:
			break
		case .onboarding:
			self.onboardingView = makeOnboardingView()
		case .signedIn:
			self.signedInView = makeSignedInView()
		}
	}
}
