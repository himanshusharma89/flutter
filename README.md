# Tradewinds

The Flutter project devloping under The Uplift Project

## Clean Code Guide Lines

- General Rule of thumb is to have 1 Widget per File, If a screen has multiple widgets break them down and put them in to their file either in the same folder or in the widgets folder.
- Each file should be a maximum of 200-300 lines. If longer than that, extract code to another widget.
- Variables, Methods, Objects to be readable
  `e.g. updateStatus, showConfirmButton`
  (Please do not use generic words. Ask your teammates if you are confused about what wordings to use.)
- Reuse code. Do not duplicate code in many places. Reuse code that has been written.
- Remove unused code and unused libraries.
- File names to hyphenated. E.g. profile_screen.dart. (Please do not use ProfileScreen).
- Always use a Strongly Typed Code i.e. Every Variable should have concrete type, Don't use dynamic type for variables.
- All static values to be declared constants in lib > util.
`E.g. “Action performed successfully” to be moved into lib > util > display_constants.dart`
- If you are building a page, please name it with suffix, _screen.dart. If you are creating Profile Screen, then name it as`profile_screen.dart`.
- If you are building a widget that is specific to only single screen then put it in to screen folder, else put it in to the widgets folder. E.g. If you are buidling a widget that will only be used in the profile screen, then put it in to the profile screen folder, else if you are building a widget that can be used more than one location, put it in the widgets folder.
- Use Standard formatting and trailing commas. [For More Info, check the official Docs](https://flutter.dev/docs/development/tools/formatting).
