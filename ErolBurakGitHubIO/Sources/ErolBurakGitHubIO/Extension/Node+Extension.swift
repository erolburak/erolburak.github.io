//
//  Node+Extension.swift
//
//
//  Created by Burak Erol on 12.02.24.
//

import Foundation
import Plot
import Publish

extension Node where Context == HTML.DocumentContext {
    // MARK: - Methods

    static func customHead(for location: Location,
                           on site: some Website,
                           with language: Language) -> Node
    {
        .head(.encoding(.utf8),
              .siteName(site.name),
              .url(URL(string: site.url.absoluteString + (language == .german ? "/de" : "/en") + location.path.absoluteString)!),
              .title(location.title.isEmpty ? site.name : location.title + " | " + site.name),
              .stylesheet("/styles.css"),
              .viewport(.accordingToDevice),
              .unwrap(site.favicon) {
                  .favicon($0)
              },
              .unwrap(location.imagePath ?? site.imagePath) { path in
                  .socialImageLink(site.url(for: path))
              })
    }
}
