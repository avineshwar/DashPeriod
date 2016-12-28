# Change Log
All notable changes to this project will be documented in this file.
`JTAppleCalendar` adheres to [Semantic Versioning](http://semver.org/).

#### 6.x Releases
- `6.0.x` Releases - [6.0.0](#600)|[6.0.1](#601)|[6.0.2](#602)|[6.0.3](#603)|[6.0.4](#604)|[6.0.5](#605)
- `6.0.0` Betas - [6.0.0-beta.1](#600-beta1)

#### 5.x Releases
- `5.0.0` Releases - [5.0.0](#500)|[5.0.1](#501)

#### 4.x Releases
- `4.1.0` Releases - [4.1.0](#410)|[4.1.1](#411)|[4.1.2](#412)|[4.1.3](#413)|[4.1.4](#414)
- `4.0.0` Releases - [4.0.0](#400)|[4.0.1](#401)|[4.0.2](#402)|[4.0.3](#403)

#### 3.x Releases
- `3.0.0` Releases - [3.0.0](#300)|[3.0.1](#301)

#### 2.x Releases
- `2.1.0` Releases - [2.1.0](#210)|[2.1.1](#211)|[2.1.2](#212)
- `2.0.0` Releases - [2.0.0](#200)|[2.0.1](#201)|[2.0.2](#202)|[2.0.3](#203)

#### 1.x Releases
- `1.1.x` Releases - [1.1.0](#110)| [1.1.1](#111)
- `1.0.x` Releases - [1.0.0](#100)

---
## [6.0.5](https://github.com/patchthecode/JTAppleCalendar/releases/tag/6.0.5)
- [Floating point error fix](https://github.com/patchthecode/JTAppleCalendar/issues/211)


## [6.0.4](https://github.com/patchthecode/JTAppleCalendar/releases/tag/6.0.4)
- [Fixed wrong date bug](https://github.com/patchthecode/JTAppleCalendar/commit/1689586c70e2fbd9785794c4fc8c5f094403e98f)

## [6.0.3](https://github.com/patchthecode/JTAppleCalendar/releases/tag/6.0.3)
- [Fixed wrong date bug](https://github.com/patchthecode/JTAppleCalendar/issues/210)
- Fixed Scrolling issues with new segment code

## [6.0.2](https://github.com/patchthecode/JTAppleCalendar/releases/tag/6.0.2)
- Fixed error: [Cells are not updated properly because of pre-fetching](https://github.com/patchthecode/JTAppleCalendar/issues/196)
- New Feature: Gesture functionality added
- Fixed error: [Fix for vertical direction](https://github.com/patchthecode/JTAppleCalendar/commit/4d48c594e00864dbe470dc64dbfd2e8790dbe783)
- Fixed error: [Vertical cell size](https://github.com/patchthecode/JTAppleCalendar/commit/8e85b784bfe5ff8669157f42aee17aaee99a9429)
- Fixed error: [Reload data completionhandler does not work when view is first loaded](https://github.com/patchthecode/JTAppleCalendar/commit/da0a0ad9b22b6e50fa2feec644afaa6902ad4a5e)

## [6.0.1](https://github.com/patchthecode/JTAppleCalendar/releases/tag/6.0.1)
- Fixed error: [Left over artifacts](https://github.com/patchthecode/JTAppleCalendar/commit/f5be1e1c281cb08337ede276403311b3ee4a4e9f)
- Fixed error: [Potential infinite loop on scrollViewDidEnd](https://github.com/patchthecode/JTAppleCalendar/commit/a115ff9301118fd93ab8ed960ba33ebeb28b8f7b)
- Update: [Changed variable names for consistency](https://github.com/patchthecode/JTAppleCalendar/commit/3eca0fddc79a6425c146b65aabd2ff31b0c0d05d)
- Update: [Added functionality to flip calendar horizontally for ethnic calendars](https://github.com/patchthecode/JTAppleCalendar/commit/a991b898a2ce5bc3a678bcf0b43a8e381e56a840)
- Update: `ConfigureCaneldar` function signature has changed. 
- Fixed error: [XCode 8.1 has a bug](https://github.com/patchthecode/JTAppleCalendar/commit/97363897006877b62ebfb357cb98160a1b5b291b). So a work around was implemented 

## [6.0.0](https://github.com/patchthecode/JTAppleCalendar/releases/tag/6.0.0)
- Added functionality to get dateCell by CGPoint

## [6.0.0-beta.1](https://github.com/patchthecode/JTAppleCalendar/releases/tag/6.0.0-beta.1)
- Made function names more standardised
- Added ability enable/disable in-dates/out-dates generation
- Added ability to choose buldle for xib files

## [5.0.1](https://github.com/patchthecode/JTAppleCalendar/releases/tag/5.0.1)
- Bug Fix: [Crash on negative scroll in vertical mode](https://github.com/patchthecode/JTAppleCalendar/issues/115)

## [5.0.0](https://github.com/patchthecode/JTAppleCalendar/releases/tag/5.0.0)
- Bug Fix: [Double calling of delegate method on finger lift](https://github.com/patchthecode/JTAppleCalendar/issues/102)
- Bug Fix: [Delegate call fixed when user scrolls to top using status bar](https://github.com/patchthecode/JTAppleCalendar/issues/89)
- Bug Fix: [Crash when calenader switched to single row](https://github.com/patchthecode/JTAppleCalendar/issues/111)
- Update: Added range selection
- Update: [Deprecations](https://github.com/patchthecode/JTAppleCalendar/wiki/Message-to-testers-working-on-master-branch)
- Update: JTApplecalendar now works for tvOS
  - Updated by [JayT](https://github.com/patchthecode).

## [4.1.4](https://github.com/patchthecode/JTAppleCalendar/releases/tag/4.1.4)
- Bug Fixes: [Scroll to section bug introduced](https://github.com/patchthecode/JTAppleCalendar/issues/96)
  - Updated by [JayT](https://github.com/patchthecode).

## [4.1.3](https://github.com/patchthecode/JTAppleCalendar/releases/tag/4.1.3)
- Added missing functionality: To give dev a chance to clean up the cell before being reused.
- Added missing functionality: Headers can now be registered using classes.
- Bug Fixes: [Crash when using multiplel instance of JTAppleCalendar](https://github.com/patchthecode/JTAppleCalendar/issues/75)
  - Updated by [JayT](https://github.com/patchthecode).

## [4.1.2](https://github.com/patchthecode/JTAppleCalendar/releases/tag/4.1.1)
- Fixed issue: removed forced unwrapping of date on deselection. [Caused crash](https://github.com/patchthecode/JTAppleCalendar/issues/69)
- Fixed issue: on reloading index paths, removed dupicates. Caused visual glitch.
  - Updated by [JayT](https://github.com/patchthecode).

## [4.1.1](https://github.com/patchthecode/JTAppleCalendar/releases/tag/4.1.1)
- Fixed issue: Various bug fixes and enhancements
   - [Days of the week can now be used in calculations]()
   - [Cells cannot be decelected sometimes](https://github.com/patchthecode/JTAppleCalendar/issues/67)
   - [Bug on multiple selection](https://github.com/patchthecode/JTAppleCalendar/issues/64)
   - [Bug when 2 months are displayed](https://github.com/patchthecode/JTAppleCalendar/issues/63)
   - performance fix
- Added functoin to generate dates and select date range
  - Updated by [JayT](https://github.com/patchthecode).

## [4.1.0](https://github.com/patchthecode/JTAppleCalendar/releases/tag/4.1.0)
- Feature Added: Devs can now configure the width and height of a dateCell.
- Fixed issue: Synchonization issues on calendar start
- Fixed issue: Fixed layout [Bug](https://github.com/patchthecode/JTAppleCalendar/issues/57)
- performance fixes
  - Updated by [JayT](https://github.com/patchthecode).

## [4.0.3](https://github.com/patchthecode/JTAppleCalendar/releases/tag/4.0.3)
- Fixed issue: Performance fixes - Library should work smooth on an iPhone 4s
- Fixed issue: Scroll to segments were not calling completion handlers
- Fixed issue: Added fix for device orientation
- Added missing functionality: Devs can now register cells by type
  - Updated by [JayT](https://github.com/patchthecode).
  - Fix added by: [Baptiste Sansierra](https://github.com/patchthecode/JTAppleCalendar/pull/48)
  - Functionality added by: [Encero](https://github.com/patchthecode/JTAppleCalendar/pull/49)

## [4.0.2](https://github.com/patchthecode/JTAppleCalendar/releases/tag/4.0.2)
- Fixed issue: Layout issue in 4.0.1. 
  - Updated by [JayT](https://github.com/patchthecode).

## [4.0.1](https://github.com/patchthecode/JTAppleCalendar/releases/tag/4.0.1)
- Fixed issue: Performance fixes 
- Fixed issue: Layout issues
  - Updated by [JayT](https://github.com/patchthecode).

## [4.0.0](https://github.com/patchthecode/JTAppleCalendar/releases/tag/4.0.0)
- Fixed issue: Performance fixes 
- Fixed issue: Changed way numberOfRows is configured. New way solves concurrency issues
  - Updated by [JayT](https://github.com/patchthecode).

## [3.0.1](https://github.com/patchthecode/JTAppleCalendar/releases/tag/3.0.1)
- Fixed issue: Cell Inset was borken with 3.0.0 release
- Fixed issue: canSelectDate always returned true. 
  - Updated by [JayT](https://github.com/patchthecode).
  
## [3.0.0](https://github.com/patchthecode/JTAppleCalendar/releases/tag/3.0.0)
- Fixed: Issue [#20](https://github.com/patchthecode/JTAppleCalendar/issues/20). Layout should be set to needsUpdate when firstDayOfWeek changes
- Update: Issue [#19](https://github.com/patchthecode/JTAppleCalendar/issues/19). DidScroll delegate will now only get called when user scolls. This makes clear system actions vs user actions.
- Fixed: Issue [#18](https://github.com/patchthecode/JTAppleCalendar/issues/18). Selecting out-dates now also select their date counterparts.
- Update: Issue [#16](https://github.com/patchthecode/JTAppleCalendar/issues/16). Headers are now added to the project.
  - Updated by [JayT](https://github.com/patchthecode).

## [2.1.2](https://github.com/patchthecode/JTAppleCalendar/releases/tag/2.1.2)
- Fixed: When selecting date with delegates disabled, calendar shifted to month offset. This was due to the newly added smooth scrolling feature
- Update: The CellState for a date now returns more information. It now returns (added to its previous info) a date and a day.
- Update: New function added so user can query the visible dateCells on the screen: cellStatusForDateAtRow(_: Int, column: Int)
- Update: With paging disbled, the scrolling now snaps to day
  - Updated by [JayT](https://github.com/patchthecode).

## [2.1.1](https://github.com/patchthecode/JTAppleCalendar/releases/tag/2.1.1)
- Crash on using NSDate() without a formatter for date ranges [Issue 11](https://github.com/patchthecode/JTAppleCalendar/issues/11)
  - Updated by [JayT](https://github.com/patchthecode).

## [2.1.0](https://github.com/patchthecode/JTAppleCalendar/releases/tag/2.1.0)
- Calendar paging is now an option
- Scroll to date method will now scroll to a date if paging is set to off. [Issue 10](https://github.com/patchthecode/JTAppleCalendar/issues/10)
  - Updated by [JayT](https://github.com/patchthecode).


## [2.0.3](https://github.com/patchthecode/JTAppleCalendar/releases/tag/2.0.3)
- Fixed visual bug. Now there should be no flickering when scrolling dates.
- Updated sample code 
  - Updated by [JayT](https://github.com/patchthecode).


## [2.0.2](https://github.com/patchthecode/JTAppleCalendar/releases/tag/2.0.2)
- Added functionality to not trigger delegates on selecting dates
- Updated sample code 
  - Updated by [JayT](https://github.com/patchthecode).


## [2.0.1](https://github.com/patchthecode/JTAppleCalendar/releases/tag/2.0.0)
- Added function to handle date selection in Arrays
  - Updated by [JayT](https://github.com/patchthecode).


## [2.0.0](https://github.com/patchthecode/JTAppleCalendar/releases/tag/2.0.0)
Released on 2016-04-5. All issues associated with this milestone can be found using this 
[filter](https://github.com/patchthecode/JTAppleCalendar/milestones/Obvious%20things%20that%20were%20missed%20in%20Initial%20Coding)

#### Updated
- fixed date selection method. 
- made didSelectDate function return an optional object. The value can be nil if the selected date is off the screen.
  - Updated by [JayT](https://github.com/patchthecode).


## [1.1.1](https://github.com/patchthecode/JTAppleCalendar/releases/tag/1.1.1)
Released on 2016-03-20.

#### Updated
- Updated packages
- Updated by [JayT](https://github.com/patchthecode).


## [1.1.0](https://github.com/patchthecode/JTAppleCalendar/releases/tag/1.1.0)
Released on 2016-03-28.

#### Updated
- Added functionality to query current date section
- Calendar-view now reloads on datasource change
  - Updated by [JayT](https://github.com/patchthecode).


## [1.0.0](https://github.com/patchthecode/JTAppleCalendar/releases/tag/1.0.0)
Released on 2016-03-27.

#### Added
- Initial release of JTAppleCalendar.
  - Added by [JayT](https://github.com/patchthecode).
