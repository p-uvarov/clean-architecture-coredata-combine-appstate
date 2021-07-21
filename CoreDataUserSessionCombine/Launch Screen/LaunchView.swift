//
//  LaunchView.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import SwiftUI

struct LaunchView: View {
	// MARK: - Properties
	@StateObject var viewModel: LaunchViewModel

	// MARK: - SwiftUI body
	var body: some View {
		Text("Launch View")
			.font(.title)
			.onAppear(perform: viewModel.onAppear)
	}
}

