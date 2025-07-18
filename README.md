# expensetracker

<!-- Remember to add "<uses-permission android:name="android.permission.INTERNET" />" this line of code to ./android/app/src/main/AndroidManifest.xml!!!! -->

to do

most important with the new fastening of the app:
- adding transactions adds 2 to the UI. on the spreadsheet, only one. changes when you refresh
example, i added an expense of 2000. i had 4000 showing balance. when i added, two duplicate entries were made, and balance showed -4000. on refresh it showed 2000. so, yeah.

nooooo what happens is it adds a duplicate transaction as well as only adding the current sum present on the screen
somehow it removes the first ever transaction, i really dont know whats happening here

Functions
- more info: hour:minute time, list of items for expense
- undo last transaction
- swipe to reveal delete button and then delete transactions ( confirmation on it )
- last item in the list of transactions will be an option that takes you directly to the spreadsheet!!
- pressing a button immediately takes you to type
- icon on the top right can be voice input lol
- going into negatives is illegal?

UI
- + and - buttons are weird STILL BRO FIX IT
- text limit for entries
- when there are lots of entries, the gap between the end and the buttons is too little
- when the entry list goes out of the box, make a cool fade or something visual rather than just abruptly cutting it off
- detailed transaction on tap, opens up to a bigger menu or animate tile into full view smth smth
- inner shadow on the cards and buttons to add that extra coolness

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
