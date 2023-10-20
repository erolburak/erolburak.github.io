import Foundation
import Plot
import Publish

struct ErolburakMe: Website {

	// MARK: - Type Definitions

	enum SectionID: String, WebsiteSectionID {
		case home
	}

	// MARK: - Properties

	var description = "A simple website to represent my portfolio as a Senior iOS Developer."
	var imagePath: Path? { nil }
	var language: Language { .english }
	var name = "Portfolio"
	var url = URL(string: "https://erolburak.me")!

	// MARK: - Layouts

	struct ItemMetadata: WebsiteItemMetadata {}
}

try ErolburakMe().publish(using: [.addMarkdownFiles(),
								  .copyResources(),
								  .generateHTML(withTheme: .foundation),
								  .generateRSSFeed(including: []),
								  .generateSiteMap(),
								  .deploy(using: .gitHub("erolburak/erolburak.me",
														 branch: "develop",
														 useSSH: false))])
