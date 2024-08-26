//
//  Markdown.swift
//
//
//  Created by Burak Erol on 25.10.23.
//

import Plot
import Publish

struct Markdown: Component {
    // MARK: - Properties

    let contentBody: Content.Body

    // MARK: - Layouts

    var body: Component {
        Node.contentBody(contentBody)
    }
}
