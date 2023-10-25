//
//  Wrapper.swift
//
//
//  Created by Burak Erol on 25.10.23.
//

import Plot

struct Wrapper: ComponentContainer {

	// MARK: - Properties

	@ComponentBuilder var content: ContentProvider

	// MARK: - Layouts

	var body: Component {
		Div(content: content)
	}
}
