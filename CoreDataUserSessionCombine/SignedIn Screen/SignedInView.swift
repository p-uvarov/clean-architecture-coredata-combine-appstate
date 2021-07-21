//
//  SignedInView.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import SwiftUI

struct SignedInView: View {
	// MARK: - Properties
	@StateObject var viewModel: SignedInViewModel

	// MARK: - SwiftUI body
	var body: some View {
		VStack {
			Text("SignedInView")
				.font(.title)
				.padding(.bottom, 10)
			Text(UserSession.shared.user?.firstName ?? "")
				.padding(.bottom, 10)
			Text(UserSession.shared.user?.lastName ?? "")
				.padding(.bottom, 10)
			Button(action: viewModel.signOut) {
				Text("Sign out")
			}
		}
	}
}
