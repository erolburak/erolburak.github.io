//
//  ErolburakMe.swift
//
//
//  Created by Burak Erol on 20.10.23.
//

import Foundation
import Plot
import Publish

struct ErolburakMe: MultiLanguageWebsite {

	// MARK: - Type Definitions

	enum SectionID: String, WebsiteSectionID {
		case portfolio
		case aboutme
	}

	// MARK: - Properties

	var description = ""
	var favicon: Favicon? {
		guard let imagePath else { return nil }
		return Favicon(path: imagePath)
	}
	var imagePath: Path? { "/images/favicon.png" }
	var language: Language = .english
	var languages = [Language.english,
					 Language.german]
	var name = "[BE]"
	var url = URL(string: "https://erolburak.me")!

	struct ItemMetadata: MultiLanguageWebsiteItemMetadata {

		// MARK: - Properties

		var alternateLinkIdentifier: String?
	}
}
