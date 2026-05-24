# SwiftUITemplateReusableComponent

A minimal Swift package that exposes a reusable SwiftUI card component.

## Included component

- `TemplateCardView`: a reusable card for title, message, optional SF Symbol, and optional button content
- `TemplateCardContent`: a portable content model that can be tested without SwiftUI
- `TemplateCardStyle`: simple reusable spacing and corner-radius tokens

## Usage

```swift
import SwiftUITemplateReusableComponent

let content = TemplateCardContent(
    title: "Reusable SwiftUI card",
    message: "Use one component across multiple screens.",
    systemImageName: "square.grid.2x2",
    actionTitle: "Get Started"
)

TemplateCardView(content: content) {
    print("Tapped")
}
```