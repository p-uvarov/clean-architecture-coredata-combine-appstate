//
//  OnboardingView.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import SwiftUI

struct OnboardingView: View {
	// MARK: - Properties
	@StateObject var viewModel: OnboardingViewModel

	// MARK: - SwiftUI body
	var body: some View {
		VStack {
			Text("OnboardingView")
				.font(.title)
				.padding(.bottom, 10)
			
			TextField("First name", text: $viewModel.firstName)
				.padding(.horizontal, 80)
				.padding(.bottom, 10)
			TextField("Last name", text: $viewModel.lastName)
				.padding(.horizontal, 80)
				.padding(.bottom, 10)
			
			Button(action: viewModel.signIn) {
				Text("Sign in")
			}
		}
		.textFieldStyle(RoundedBorderTextFieldStyle())
	}
}
