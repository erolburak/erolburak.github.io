// swift-tools-version:5.5

import PackageDescription

let package = Package(name: "ErolburakMe",
					  platforms: [.macOS(.v12)],
					  products: [.executable(name: "ErolburakMe",
											 targets: ["ErolburakMe"])],
					  dependencies: [.package(url: "https://github.com/Ze0nC/Publish.git", 
											  branch: "Multi-Language")],
					  targets: [.executableTarget(name: "ErolburakMe",
												  dependencies: ["Publish"])])
