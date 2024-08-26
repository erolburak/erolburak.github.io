//
//  Theme+Extension.swift
//
//
//  Created by Burak Erol on 20.10.23.
//

import Publish

extension Theme where Site == ErolBurakGitHubIO {
    // MARK: - Properties

    static var customTheme: Self {
        Theme(htmlFactory: CustomThemeHTMLFactory(),
              resourcePaths: ["Resources/CustomTheme/styles.css"])
    }
}
