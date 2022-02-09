import Foundation

public func code(for title: String,
    sampleCode: () -> Void) {
    print("""
___________________________
Results for: '\(title)'
""")
    sampleCode()
}
