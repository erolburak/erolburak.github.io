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
                       context: PublishingContext<Site>) throws -> HTML
    {
        HTML(.lang(index.language!),
             .customHead(for: index,
                         on: context.site,
                         with: index.language!),
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
                         context: PublishingContext<Site>) throws -> HTML
    {
        HTML(.lang(section.language!),
             .customHead(for: section,
                         on: context.site,
                         with: section.language!),
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
                      context: PublishingContext<Site>) throws -> HTML
    {
        HTML(.lang(page.language!),
             .customHead(for: page,
                         on: context.site,
                         with: page.language!),
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

    func makeItemHTML(for _: Item<Site>,
                      context _: PublishingContext<Site>) throws -> HTML
    {
        HTML()
    }

    func makeTagListHTML(for _: TagListPage,
                         context _: PublishingContext<Site>) throws -> HTML? { nil }

    func makeTagDetailsHTML(for _: TagDetailsPage,
                            context _: PublishingContext<Site>) throws -> HTML? { nil }
}
