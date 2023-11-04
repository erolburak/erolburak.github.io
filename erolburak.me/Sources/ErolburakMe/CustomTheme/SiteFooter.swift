//
//  SiteFooter.swift
//
//
//  Created by Burak Erol on 25.10.23.
//

import Foundation
import Plot

struct SiteFooter: Component {

	// MARK: - Layouts

	var body: Component {
		Footer {
			Text("© \(Calendar.current.component(.year, from: .now)) Burak Erol")
		}
	}
}
