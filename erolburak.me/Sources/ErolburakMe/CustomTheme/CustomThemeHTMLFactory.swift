//
//  CustomThemeHTMLFactory.swift
//
//
//  Created by Burak Erol on 20.10.23.
//

import Foundation
import Plot
import Publish

struct CustomThemeHTMLFactory<Site: Website>: HTMLFactory {

	// MARK: - Layouts

	func makeIndexHTML(for index: Index,
					   context: PublishingContext<Site>) throws -> HTML {
		HTML(.lang(index.language!),
			 .head(for: index,
				   on: context.site),
			 .body {
				 SiteHeader(context: context,
							language: index.language!,
							selectedSelectionID: nil)

				 Wrapper {
					 H1(index.title)

					 Paragraph(index.language == .german ? "Mein Portfolio als Senior iOS Entwickler." : "My portfolio as a Senior iOS Developer.")
						 .class("description")
				 }

				 SiteFooter()
			 })
	}

	func makeSectionHTML(for section: Section<Site>,
						 context: PublishingContext<Site>) throws -> HTML {
		HTML(.lang(section.language!),
			 .head(for: section,
				   on: context.site),
			 .body {
				 SiteHeader(context: context,
							language: section.language!,
							selectedSelectionID: section.id)

				 Wrapper {
					 H1(Localization.shared.sectionTitle(language: section.language!,
														 section: section.id.rawValue).uppercased())
				 }

				 SiteFooter()
			 })
	}

	func makeItemHTML(for item: Item<Site>,
					  context: PublishingContext<Site>) throws -> HTML {
		HTML()
	}

	func makePageHTML(for page: Page,
					  context: PublishingContext<Site>) throws -> HTML {
		HTML(.lang(page.language!),
			 .head(for: page,
				   on: context.site),
			 .body {
				 SiteHeader(context: context,
							language: page.language!,
							selectedSelectionID: nil)

//				 Wrapper(page.body)

				 SiteFooter()
			 })
	}

	func makeTagListHTML(for page: TagListPage,
						 context: PublishingContext<Site>) throws -> HTML? { nil }

	func makeTagDetailsHTML(for page: TagDetailsPage,
							context: PublishingContext<Site>) throws -> HTML? { nil }
}

private struct Wrapper: ComponentContainer {

	// MARK: - Properties

	@ComponentBuilder var content: ContentProvider

	// MARK: - Layouts

	var body: Component {
		Div(content: content)
			.class("wrapper")
	}
}

private struct SiteHeader<Site: Website>: Component {

	// MARK: - Private Properties

	private var languagePath: String { language == .german ? "/de/" : "/en/" }

	// MARK: - Properties

	var context: PublishingContext<Site>
	var language: Language
	var selectedSelectionID: Site.SectionID?

	// MARK: - Layouts

	var body: Component {
		Header {
			Wrapper {
				let lastPath = selectedSelectionID != nil ? context.sections[selectedSelectionID!].path.string + "/" : ""

				Link(context.site.name,
					 url: languagePath)
				.class("site-name")

				Link(language == .german ? "EN" : "DE",
					 url: (language == .german ? "/en/" : "/de/") + lastPath)

				if Site.SectionID.allCases.count > 1 {
					navigation
				}
			}
		}
	}

	private var navigation: Component {
		Navigation {
			List(Site.SectionID.allCases) { sectionID in
				let section = context.sections[sectionID]
				return Link(Localization.shared.sectionTitle(language: language,
															 section: section.id.rawValue).uppercased(),
							url: languagePath + section.path.string)
				.class(sectionID == selectedSelectionID ? "selected" : "")
			}
		}
	}
}

private struct SiteFooter: Component {

	// MARK: - Layouts

	var body: Component {
		Footer {
			Text("© \(Calendar.current.component(.year, from: .now)) Burak Erol.")
		}
	}
}

private class Localization {

	// MARK: - Properties

	static let shared = Localization()

	func sectionTitle(language: Language,
					  section: ErolburakMe.SectionID.RawValue) -> String {
		var title = ""
		if language == .german {
			if section == ErolburakMe.SectionID.portfolio.rawValue {
				title = "Portfolio"
			} else if section == ErolburakMe.SectionID.aboutme.rawValue {
				title = "Über mich"
			}
		} else {
			if section == ErolburakMe.SectionID.portfolio.rawValue {
				title = "Portfolio"
			} else if section == ErolburakMe.SectionID.aboutme.rawValue {
				title = "About me"
			}
		}
		return title
	}
}
