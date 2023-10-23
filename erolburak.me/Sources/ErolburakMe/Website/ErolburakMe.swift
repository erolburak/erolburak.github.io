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

	var description = "A simple website to represent my portfolio as a Senior iOS Developer."
	var imagePath: Path? { nil }
	var language: Language = .english
	var languages = [Language.english,
					 Language.german]
	var links = [Links(icon: "Images/linkedin-in.svg",
					   title: "LinkedIn",
					   url: "https://linkedin.com/in/burakerol44"),
				 Links(icon: "fa-brands fa-xing",
					   title: "XING",
					   url: "https://xing.com/profile/Burak_Erol6"),
				 Links(icon: "fa-brands fa-github",
					   title: "GitHub",
					   url: "https://github.com/erolburak"),
				 Links(icon: "fa-solid fa-code",
					   title: "Portfolio",
					   url: "https://erolburak.me/portfolio"),
				 Links(icon: "fa-solid fa-envelope",
					   title: "Email",
					   url: "mailto:erolburak@icloud.com")]
	var name = "Portfolio"
	var url = URL(string: "https://erolburak.me")!

	struct ItemMetadata: MultiLanguageWebsiteItemMetadata {

		// MARK: - Properties

		var alternateLinkIdentifier: String?
	}
}
