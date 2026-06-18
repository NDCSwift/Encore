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

## Go further

Want to drill deeper into any concept from the course? Each topic below has its own focused video + repo on the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding) — clone, run, and dig in.

### Deepen a chapter

| Encore chapter | Focused tutorial | Repo | Video |
|---|---|---|---|
| Ch 2 — SwiftData | Task Tracker — SwiftData persistence from scratch | [TaskTracker](https://github.com/NDCSwift/TaskTracker-2026SwiftUITutorial) | [Watch](https://youtu.be/ayn9CdqbI_Y) |
| Ch 3 — Navigation & Tabs | `NavigationStack` + `TabView` together | [SwiftUInavigationTabViewExample2](https://github.com/NDCSwift/SwiftUInavigationTabViewExample2) | [Watch](https://youtu.be/m8KvqS7VMZs) |
| Ch 4 — Lists & Live Data | `List` + `ForEach`, rows, swipe & deletion | [List_ForEach](https://github.com/NDCSwift/List_ForEach) | [Watch](https://youtu.be/aUtXo0VTxE8) |
| Ch 5 — Forms & Validation | Real-time form validation & submit gating | [FormValidator](https://github.com/NDCSwift/FormValidator) | [Watch](https://youtu.be/X6KXdmcjuCU) |
| Ch 8 — Onboarding gate | `@AppStorage` persistence deep dive | [SwiftUI-AppStorageExample](https://github.com/NDCSwift/SwiftUI-AppStorageExample) | [Watch](https://youtu.be/ioKgvLOGuK8) |
| Ch 8 — Permissions | Local notifications + permission requests | [LocalNotificationExampleSwiftUI](https://github.com/NDCSwift/LocalNotificationExampleSwiftUI) | [Watch](https://youtu.be/yTtB5eKrahM) |
| Ch 9 — Stats | Swift Charts — bar, line & area charts | [ChartKitExample](https://github.com/NDCSwift/ChartKitExample) | [Watch](https://youtu.be/nz9SOol9czw) |
| Ch 10 — Empty states | `ContentUnavailableView` — every empty state | [ContentUnavailableView_SwiftUI](https://github.com/NDCSwift/ContentUnavailableView_SwiftUI) | [Watch](https://youtu.be/FeNIGjSpaCo) |
| Ch 11 — App icon | Liquid Glass icons with Icon Composer | [MonkeyAppIconExample](https://github.com/NDCSwift/MonkeyAppIconExample) | [Watch](https://youtu.be/srOFdUvRmsc) |

### Beyond the course

The "Where to go next" topics above, each as a standalone build:

| Topic | Repo | Video |
|---|---|---|
| iCloud sync with SwiftData + CloudKit | [CloudKitDemo](https://github.com/NDCSwift/CloudKitDemo) | [Watch](https://youtu.be/rtlVb6aazFg) |
| In-app purchases with StoreKit 2 | [StoreKitDemo](https://github.com/NDCSwift/StoreKitDemo) | [Watch](https://youtu.be/BI-ohzQ7GuI) |
| WidgetKit — home screen widgets w/ live data | [CatFactsWidgets](https://github.com/NDCSwift/CatFactsWidgets) | [Watch](https://youtu.be/KalCtyjgfRc) |
| API integration — async/await + Codable | [SwiftUIAPIExampleOpen-Meteo](https://github.com/NDCSwift/SwiftUIAPIExampleOpen-Meteo) | [Watch](https://youtu.be/hvjqUuhmNZQ) |
| On-device AI — Apple FoundationModels | [FoundationModels_SwiftUI](https://github.com/NDCSwift/FoundationModels_SwiftUI) | [Watch](https://youtu.be/GuOzhtChwT8) |

---

## License

See [LICENSE](LICENSE) if present, otherwise this code is provided as-is for educational use alongside the video.
