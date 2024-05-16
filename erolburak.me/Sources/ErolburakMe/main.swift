//
//  main.swift
//
//
//  Created by Burak Erol on 20.10.23.
//

try ErolburakMe().publish(using: [.copyResources(),
								  .addMarkdownFiles(),
								  .generateHTML(withTheme: .customTheme),
								  .copyDefaultIndexHtml(),
								  .deploy(using: .gitHub("erolburak/erolburak.me",
														 branch: "develop",
														 useSSH: false))])
