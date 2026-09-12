# Oorangadi — Project

> The single status doc for **Oorangadi** (Min-tier): tracker + backlog + decisions in one file.
> Minimalistic Sales App with local-first principle, built on Flutter with web release as MVP.

---

## Now (in progress)

| Item | Status | PR |
| :--- | :--- | :--- |
| **Sprint 0: Specification & Foundation Spike** — Min-tier adoption, Flutter web scaffold, Drift/WASM database baseline, and MVP landing page | 🚧 In Progress | — |

---

## Next (Brainstormed Backlog, Roughly Ordered)

### Sprint 1: Local Database Foundation & Product Catalog
- [ ] **Drift Local-First Schema**:
  - `products` (id, name, barcode/sku, price_cents, cost_cents, category_id, stock_quantity, track_stock, is_active, created_at, updated_at)
  - `categories` (id, name, color, icon, sort_order)
- [ ] **Catalog Repository & CRUD**:
  - Add / edit / archive products
  - Category filtering and fast keyword search (local SQLite index)
  - Quick-pick grid view & compact list view
- [ ] **Unit & Drift Database Tests**:
  - Memory-based Drift tests for CRUD and queries

### Sprint 2: Sales Counter & Quick Cart (The Core POS Engine)
- [ ] **Quick Cart State (Riverpod)**:
  - Add product by click, tap, or barcode scan
  - Line item quantity adjust (+ / - / manual input)
  - Custom line discount or order-level discount (%)
  - Tax calculation (configurable default rate / inclusive or exclusive)
- [ ] **Fast Keyboard / Touch Shortcuts**:
  - Quick search shortcut (`/` or `Ctrl+K`), quick pay shortcut (`Space` or `Enter`), clear cart (`Esc`)
- [ ] **Checkout Settlement**:
  - Payment modes: Cash (with quick change calculator: ₹100, ₹500, exact), UPI / Digital QR, Card, Split
  - Instant transaction commit to local SQLite (ACID guarantees)

### Sprint 3: Orders History, Receipts & Printable Layouts
- [ ] **Orders & Order Items Schema**:
  - `orders` (id, order_number, subtotal_cents, discount_cents, tax_cents, total_cents, payment_method, status, created_at)
  - `order_items` (id, order_id, product_id, product_name, unit_price_cents, quantity, line_total_cents)
- [ ] **Sales History & Details Viewer**:
  - Daily order timeline with summary (total sales count, total revenue, average order value)
  - Order cancellation / refund flag
- [ ] **Printable & Shareable Receipts**:
  - Minimalistic 58mm / 80mm thermal receipt layout (browser print dialog)
  - Digital receipt shareable summary (plain text or clipboard copy)

### Sprint 4: Data Sovereignty — Local Backup, Restore & CSV Reports
- [ ] **Data Export / Import**:
  - Full JSON backup file export (schema versioned)
  - JSON restore / seed mechanism
  - Products CSV import & export (for bulk catalog updates)
  - Daily/Monthly sales ledger CSV export
- [ ] **Privacy & Zero-Cloud Guarantee**:
  - Status indicator confirming 100% offline data integrity
  - Cache persistence verification for browser storage (IndexedDB persistence request)

### Candidate Future Enhancements (Post-MVP)
- [ ] Multi-device sync using peer-to-peer / local network or private cloud storage (e.g. Google Drive / iCloud)
- [ ] Barcode scanning via device camera (`mobile_scanner` for mobile/web)
- [ ] Multi-currency and multi-language (English + Tamil) support
- [ ] Customer ledger (Khata / Udhar / Store credit tracking)

---

## Done

| Item | Shipped | PR |
| :--- | :--- | :--- |
| Project created from blueprint template, pruned to Min-tier | v0.1.0-alpha | — |
| Flutter 3.47 Web scaffolding with `io.vteial.oorangadi` identifier | v0.1.0-alpha | — |
| Tech stack adopted from Saranidhi (Riverpod, Drift, GoRouter, Freezed) | v0.1.0-alpha | — |
| Minimal landing page showcasing MVP pillars & backlog preview | v0.1.0-alpha | — |

---

## Decisions & Gotchas

> Capture the *why* at the moment you decide — this is the Min-tier memory layer.

| Date | Decision / Gotcha | Why |
| :--- | :--- | :--- |
| 2026-09-12 | Adopt **Min tier** over Core | Oorangadi is starting as a focused MVP/PoC with collapsed sprint flows (Flow 3 & 4) to move fast with zero documentation overhead. |
| 2026-09-12 | Single-currency integer cents for monetary values | Store amounts as integers (`cents` / `paise`) to prevent IEEE 754 floating-point rounding errors during calculations. |
| 2026-09-12 | Web-first SQLite via Drift WASM (`sqlite3.wasm` + web worker) | Provides authentic relational SQL transactions inside the browser without requiring a backend server. |
| 2026-09-12 | Pin `sqlparser: 0.44.5` dependency override | Adopted from Saranidhi to protect against upstream breaking change in `sqlparser 0.44.6` where `.when()` was removed from `DartPlaceholder`. |
| 2026-09-12 | Enforce `very_good_analysis` with zero warnings | Strict linting prevents tech debt from day one while maintaining clean Dart style. |

---

## How We Work (Min)

- **Human is sole merge & release authority**: The AI agent writes code and opens PRs; the human lead merges and tags.
- **PR as record**: Every PR body states **what changed · why · `Tested:`** (with local verification proof).
- **One source of truth**: `PROJECT.md` is the single status & decisions document; `README.md` points here.
- **Graduation rule**: Adopt heavier Core practices (dossiers, docs audit) only when burned without them.
