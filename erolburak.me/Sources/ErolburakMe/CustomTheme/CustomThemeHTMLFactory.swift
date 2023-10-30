//
//  CustomThemeHTMLFactory.swift
//
//
//  Created by Burak Erol on 20.10.23.
//

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
							selectedSectionId: nil)

				 Wrapper {
					 Markdown(contentBody: index.body)
				 }
				 .class("wrapper")

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
							selectedSectionId: section.id)

				 Wrapper {
					 Markdown(contentBody: section.body)
				 }
				 .class("wrapper")

				 SiteFooter()
			 })
	}

	func makePageHTML(for page: Page,
					  context: PublishingContext<Site>) throws -> HTML {
		HTML(.lang(page.language!),
			 .head(for: page,
				   on: context.site),
			 .body {
				 SiteHeader(context: context,
							language: page.language!,
							selectedSectionId: nil)

				 Wrapper {
					 Markdown(contentBody: page.body)
				 }
				 .class("wrapper")

				 SiteFooter()
			 })
	}

	func makeItemHTML(for item: Item<Site>,
					  context: PublishingContext<Site>) throws -> HTML {
		HTML()
	}

	func makeTagListHTML(for page: TagListPage,
						 context: PublishingContext<Site>) throws -> HTML? { nil }

	func makeTagDetailsHTML(for page: TagDetailsPage,
							context: PublishingContext<Site>) throws -> HTML? { nil }
}
