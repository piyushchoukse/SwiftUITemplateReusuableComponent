import Testing
@testable import SwiftUITemplateReusableComponent

@Test func templateCardContentStoresValues() {
    let content = TemplateCardContent(
        title: "Welcome",
        message: "Build reusable components once and use them everywhere.",
        systemImageName: "sparkles",
        actionTitle: "Continue"
    )

    #expect(content.title == "Welcome")
    #expect(content.message.contains("reusable components"))
    #expect(content.systemImageName == "sparkles")
    #expect(content.showsAction)
}

@Test func whitespaceActionTitlesAreIgnored() {
    let content = TemplateCardContent(
        title: "Welcome",
        message: "Action buttons should only render when they have visible text.",
        actionTitle: "   "
    )

    #expect(content.showsAction == false)
}

@Test func defaultStyleMatchesReusableDesignTokens() {
    let style = TemplateCardStyle.default

    #expect(style == TemplateCardStyle())
    #expect(style.cornerRadius == 16)
    #expect(style.contentPadding == 16)
    #expect(style.contentSpacing == 12)
}
