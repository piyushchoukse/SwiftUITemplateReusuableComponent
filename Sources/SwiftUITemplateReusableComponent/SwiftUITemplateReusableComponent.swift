import Foundation

public struct TemplateCardContent: Equatable, Sendable {
    public let title: String
    public let message: String
    public let systemImageName: String?
    public let actionTitle: String?

    public init(
        title: String,
        message: String,
        systemImageName: String? = nil,
        actionTitle: String? = nil
    ) {
        self.title = title
        self.message = message
        self.systemImageName = systemImageName
        self.actionTitle = actionTitle
    }

    public var showsAction: Bool {
        guard let actionTitle else {
            return false
        }

        return actionTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
    }
}

public struct TemplateCardStyle: Equatable, Sendable {
    public let cornerRadius: Double
    public let contentPadding: Double
    public let contentSpacing: Double

    public init(
        cornerRadius: Double = 16,
        contentPadding: Double = 16,
        contentSpacing: Double = 12
    ) {
        self.cornerRadius = cornerRadius
        self.contentPadding = contentPadding
        self.contentSpacing = contentSpacing
    }

    public static let `default` = Self()
}

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 16.0, macOS 13.0, *)
public struct TemplateCardView: View {
    private let content: TemplateCardContent
    private let style: TemplateCardStyle
    private let action: (() -> Void)?

    public init(
        content: TemplateCardContent,
        style: TemplateCardStyle = .default,
        action: (() -> Void)? = nil
    ) {
        self.content = content
        self.style = style
        self.action = action
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: style.contentSpacing) {
            if let systemImageName = content.systemImageName {
                Image(systemName: systemImageName)
                    .font(.title2)
                    .foregroundStyle(.accent)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(content.title)
                    .font(.headline)

                Text(content.message)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            if content.showsAction, let actionTitle = content.actionTitle {
                Button(actionTitle) {
                    action?()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(style.contentPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: style.cornerRadius, style: .continuous)
                .fill(.background)
                .shadow(color: .black.opacity(0.08), radius: 12, y: 6)
        )
    }
}

#Preview("Template card") {
    TemplateCardView(
        content: TemplateCardContent(
            title: "Reusable SwiftUI card",
            message: "Drop this component into any screen to highlight a call to action.",
            systemImageName: "square.grid.2x2",
            actionTitle: "Get Started"
        )
    )
    .padding()
    .background(Color.black.opacity(0.04))
}
#endif
