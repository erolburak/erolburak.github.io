//
//  SiteHeader.swift
//  
//
//  Created by Burak Erol on 25.10.23.
//

import Plot
import Publish

struct SiteHeader<Site: Website>: Component {

	// MARK: - Private Properties

	private var languagePath: String { language == .german ? "/de/" : "/en/" }

	// MARK: - Properties

	var context: PublishingContext<Site>
	var language: Language
	var selectedSectionId: Site.SectionID?

	// MARK: - Layouts

	var body: Component {
		Header {
			let lastPath = selectedSectionId != nil ? context.sections[selectedSectionId!].path.string + "/" : ""

			Wrapper {
				Wrapper {
					LinkImage(image: Image("/images/linkedin.svg"),
							  url: "https://linkedin.com/in/burakerol44")

					LinkImage(image: Image("/images/xing.svg"),
							  url: "https://xing.com/profile/Burak_Erol6")

					LinkImage(image: Image("/images/github.svg"),
							  url: "https://github.com/erolburak")

					LinkImage(image: Image("/images/email.svg"),
							  url: "mailto:erolburak@icloud.com")
				}
				.class("wrapper-links-leftside")

				Wrapper {
					Link(language == .german ? "EN" : "DE",
						 url: (language == .german ? "/en/" : "/de/") + lastPath)
					.class("link-language")
				}
				.class("wrapper-links-rightside")
			}
			.class("wrapper-links")

			Wrapper {
				Link(context.site.name,
					 url: languagePath)
				.class("site-name")

				if Site.SectionID.allCases.count > 1 {
					navigation
				}
			}
			.class("wrapper")
		}
	}

	private var navigation: Component {
		Navigation {
			List(Site.SectionID.allCases) { id in
				let section = context.sections[id]

				return Link(sectionTitle(language: language,
										 section: section.id.rawValue),
							url: languagePath + section.path.string)
				.class(id == selectedSectionId ? "selected" : "")
			}
		}
	}

	private func sectionTitle(language: Language,
					  section: ErolburakMe.SectionID.RawValue) -> String {
		if language == .german {
			if section == ErolburakMe.SectionID.portfolio.rawValue {
				return "Portfolio"
			} else if section == ErolburakMe.SectionID.aboutme.rawValue {
				return "Über mich"
			}
		} else {
			if section == ErolburakMe.SectionID.portfolio.rawValue {
				return "Portfolio"
			} else if section == ErolburakMe.SectionID.aboutme.rawValue {
				return "About me"
			}
		}
		return ""
	}
}
