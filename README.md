# Tradewinds - An Ecommerce App

The Flutter project developing under The Uplift Project.

[![Generic badge](https://img.shields.io/badge/TRADEWINDS-APP-ORANGE.svg)](https://github.com/himanshusharma89/flutter)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For getting started with Flutter, you can also refer
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Setting up the project
1. Go to the [project repo](https://github.com/himanshusharma89/flutter) and fork it by clicking "Fork".

2. If you are working on Windows, download the [Git Bash for Windows](https://gitforwindows.org/) to get a full Unix Bash with Git Functionality.

3. Clone the repo to your system using 
```
`git clone https://github.com/<your-github-username>/flutter`
```
4. Navigate to the project directory.
```
cd flutter
```
5. Create a new branch.
```
git checkout -b <your_branch_name>
```
6. Make changes in source code.

7. Stage your changes and commit
```
#Add changes to Index
git add .

#Commit to the local repo
git commit -m "<your_commit_message>"
```
>Sync up your local repo with [original repo](https://github.com/himanshusharma89/flutter) (Upstream) before pushing your commits. This avoids unnecessary conflicts during the merge.

8. Push your local commits to the remote repo.
```
git push -u origin <your_branch_name>
```
9. Create a PR !

10. Congratulations! you've made your contribution to tradewinds project.

## Issues
To raise specific issues, bugs, or feature requests use [this link](https://github.com/himanshusharma89/flutter/issues).


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

[![ForTheBadge built-with-love](http://ForTheBadge.com/images/badges/built-with-love.svg)](https://GitHub.com/himanshusharma89/)
