//
//  LinkImage.swift
//
//
//  Created by Burak Erol on 25.10.23.
//

import Plot

struct LinkImage: Component {

	// MARK: - Properties

	var image: Image
	var url: URLRepresentable

	// MARK: - Layouts

	var body: Component {
		Node.a(.href(url),
			   .target(.blank),
			   .component(image.class("link-image")),
			   .class("wrapper-link-image"))
	}
}
