# Oorangadi

> **Minimalistic Sales App** with a strict **local-first principle**, built on Flutter with **Web release as the MVP**.

---

## Current Status

| | |
| :--- | :--- |
| **Version** | v0.1.0-alpha |
| **Live** | Local Web / Vercel preview ready |
| **Status** | 🚧 Sprint 0: Specification & Foundation Spike |

*Full backlog, architecture decisions, and roadmap: [`PROJECT.md`](PROJECT.md).*

---

## Key Pillars

- ⚡ **Local-First & Offline-Ready** — Zero mandatory server, zero monthly hosting bills, instant query response. Data lives on your device in an embedded SQLite database running via WebAssembly (Drift WASM).
- 🛒 **Frictionless Checkout** — Streamlined keyboard and touch-first sales counter designed for quick customer billing, barcode lookup, and instant receipt calculation.
- 🔐 **Data Sovereignty** — You own your business numbers. One-click full JSON database export/import and sales ledger CSV reports.
- 🌐 **Cross-Platform Foundation** — Built on Flutter 3.47+ with Web as the primary MVP target, sharing 100% of the core logic ready for desktop and mobile.

---

## Getting Started

### Prerequisites

- Flutter SDK (stable channel, ≥3.44)
- Dart SDK ≥3.12.1 (bundled with Flutter)
- Google Chrome or Chromium (for Web execution and testing)

### Installation & Run

```bash
# Clone repository
git clone https://github.com/vteial/oorangadi.git

# Install dependencies
flutter pub get

# Run on Web (Chrome)
flutter run -d chrome

# Build production web bundle
flutter build web --release
```

### Quality & Verification Checks

```bash
# Analyze with strict lint rules (zero warnings allowed)
dart analyze --fatal-infos

# Run widget and unit tests
flutter test
```

---

## How We Work

Branch → PR → **human merges** (the AI agent opens PRs but never merges or tags).  
Each PR body states **what changed · why · how it was tested (`Tested:`)**.  
Status, backlog, and architectural decisions live in [`PROJECT.md`](PROJECT.md).  
Core load-bearing rules are defined in [`PRINCIPLES.md`](PRINCIPLES.md).

> Started from [`vteial/project-blueprint`](https://github.com/vteial/project-blueprint) (**Min** tier).
