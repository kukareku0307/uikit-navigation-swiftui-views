# UIKit Coordinator Pattern with SwiftUI Views

## Project Overview
This project demonstrates a modern **UIKit-based navigation architecture** using the **Coordinator Pattern**, seamlessly integrated with **SwiftUI** for declarative UI components. Designed with scalability and maintainability in mind, it features:

- **Clean navigation flow** with separated responsibilities (Coordinators handle routing logic)
- **SwiftUI interoperability** within UIKit via `UIHostingController`
- **Model Layer with Dependency Injection (DI)** for testable business logic
- **Hierarchical coordinators** (Root, Auth, Main, and sub-flows)
- **Tab Bar Navigation** with state-aware transitions
---

## Key Components

### 1. Coordinator Architecture
| Component           | Responsibility                          | Example                |
|---------------------|----------------------------------------|------------------------|
| **RootCoordinator** | Initial flow decision (Auth/Main)      | `start()` → Auth Flow  |
| **AuthCoordinator** | Login/Registration flows               | `showEmailConfirmation`|
| **MainCoordinator** | Tab-based flows (Home, Account, etc.)  | `handleLogoutAction()` |

### 2. Tech Stack
- **UIKit** (Core navigation framework)
- **SwiftUI** (Reusable views: `LoginScreen`, `EditAccount`)
- **DI Container** (Protocol-oriented services)
- **Delegate Pattern** (Flow event callbacks)
