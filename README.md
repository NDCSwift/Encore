# Encore — Build a Real iOS App (SwiftUI + SwiftData, iOS 26)

> 🎬 **Watch the full course:** [VIDEO LINK PLACEHOLDER]

The finished project for the **SwiftUI Full Course 2026 — Build & Ship a Real iOS App** video. Encore is a concert-tracking app: log shows you've attended, track upcoming ones, rate setlists, and see your live-music stats — built from an empty Xcode project to a TestFlight-ready, App Store-shippable build across 11 chapters.

**No API keys. No signups. Clone the repo and run.**

---

## What you'll build

A complete, single-target iOS app with:

- **MVVM architecture** using the `@Observable` macro — clear state ownership
- **SwiftData** end to end: `@Model`, `@Query`, `ModelContainer`, in-memory previews
- **iOS 18+ Tab API** and `NavigationStack` with type-safe routing
- **Live-updating lists** with search, swipe actions, and inline editing via `@Bindable`
- **One unified add/edit form** with live validation — one view, not two
- **Onboarding** with an `@AppStorage` gate and correctly-timed permission requests
- **A real Settings tab**: live stats derived from `@Query` (never stored) + one-tap `ShareLink` export
- **Empty states** (`ContentUnavailableView`) and honest local error handling
- **Polish**: a real app icon (designed in Keynote, built in Icon Composer) and a launch screen

---

## Requirements

- **Xcode 26** or later
- **iOS 26** deployment target
- Tested on the **iPhone 17** simulator (light mode)

No third-party dependencies — everything is first-party Apple frameworks.

---

## Getting started

```bash
git clone https://github.com/NDCSwift/Encore.git
cd Encore
open Encore.xcodeproj
```

Press **⌘R** to run. To follow along with a specific lesson, check out that chapter's tag (see below).

---

## Chapters & checkpoints

Every chapter ends at a known-good, green-building project state, tagged in the repo. Check out any tag to start a lesson from the exact state shown on screen:

```bash
git checkout chapter-04-complete
```

| Chapter | Topic | Tag |
|---|---|---|
| 1 | MVVM Architecture & Setup | `chapter-01-complete` |
| 2 | Data Modeling with SwiftData | `chapter-02-complete` |
| 3 | Navigation & Tab Structure | `chapter-03-complete` |
| 4 | Lists, Search & Live Data | `chapter-04-complete` |
| 5 | Forms, Validation & Data Input | `chapter-05-complete` |
| 6 | Swipe Actions & Data Updates | `chapter-06-complete` |
| 7 | Detail Views & Inline Editing | `chapter-07-complete` |
| 8 | Onboarding & Permissions | `chapter-08-complete` |
| 9 | Settings, Stats & Sharing | `chapter-09-complete` |
| 10 | Empty States & Error Handling | `chapter-10-complete` |
| 11 | Polish — App Icon, Launch Screen & Shipping | `chapter-11-complete` |

> Want to build from zero alongside the video? Check out `chapter-01-start` for the empty project.

The build is **linear** — the end of chapter N is the start of chapter N+1 — so it's tagged, not branched. Watch the chapters in order; each one builds on the last.

---

## Architecture at a glance

The whole app is one dependency chain:

`Show` struct + MVVM layers + first screen (Ch 1) → `@Model` + `ModelContainer` + `@Query`, data persists (Ch 2) → Tab + `NavigationStack` shell (Ch 3) → full list + `.searchable`, the read path (Ch 4) → swipe actions + status mutation, the write path (Ch 5/6) → detail + `@Bindable`, edit in place (Ch 7) → add/edit form + validation, the create path → onboarding gate via `@AppStorage` (Ch 8) → Settings: stats derived from `@Query` + `ShareLink` export (Ch 9) → empty + error states (Ch 10) → polish: app icon + launch screen, ship it (Ch 11).

---

## Core concepts, chapter by chapter

- **Ch 1 — `@Observable`** tracks property access; only views that read a changed property re-render.
- **Ch 2 — `@Model`** makes a Swift class persistable; it's a code generator, not a decorator.
- **Ch 3 — `NavigationStack` + Tab** — each tab owns its own stack; navigate by value, not by view.
- **Ch 4 — `@Query`** is a View-layer live wire to the store; it cannot live in a ViewModel.
- **Ch 5/6 — `sheet(item:)`** — one optional drives both presentation and data.
- **Ch 7 — `@Bindable`** unlocks `$` bindings on `@Observable` types, including `@Model`.
- **Ch 8 — `@AppStorage`** — a UserDefaults-backed `Bool` gates the app root; persists across launches.
- **Ch 9 — Derived stats** — compute from the live `@Query`; never store a count you can derive. `ShareLink(item:)` takes any `Transferable` (a `String` already is one).
- **Ch 10 — `ContentUnavailableView`** — empty is a state, not an afterthought.
- **Ch 11 — App icon + launch screen** — design the icon in Keynote, build it in Icon Composer (one `.icon` = every size + appearance). The launch screen is static, *not* a loading screen.

---

## Common mistakes (and fixes)

1. **View re-renders on the wrong property change** → you're still on `ObservableObject` + `@Published`; migrate to `@Observable`.
2. **"Cannot find ModelContext in scope"** → missing `@Environment(\.modelContext)` on the view.
3. **`@Query` won't compile in a ViewModel** → it can't. `@Query` needs a View's environment; keep filtering logic in the ViewModel, the query in the View.
4. **`$viewModel.searchText` won't compile** → a `@State`-owned `@Observable` needs `@Bindable var vm = viewModel` inside `body`.
5. **Stats don't update when you add a show** → you stored a counter instead of deriving it; compute the count from the live `@Query` every render.

---

## Where to go next

The course closes by pointing to these natural follow-ons:

- **iCloud Sync with SwiftData** — the chapter this course deliberately skipped
- **App Store Submission + TestFlight** — full shipping walkthroughs
- **WidgetKit** countdown / show-day Live Activity
- **Swift Charts** "year in live music" stats screen
- API integrations (Spotify, setlist.fm, Ticketmaster), MapKit venue pins, and a Supabase/Firebase backend

---

## License

See [LICENSE](LICENSE) if present, otherwise this code is provided as-is for educational use alongside the video.
