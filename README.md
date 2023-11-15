# Muve
 
Muve is an iOS application built for **composing** exercise routines, **sharing** those routines with your network, and **exploring** routines of other Muve users.

Version 0.1 supports the core tasks:
1. Logging in
2. Viewing a homepage of recent routines
3. Viewing a detailed view of a routine
4. Viewing a library of all a user’s routines

Version 0.1 also supports the **key task** of **composing** a new routine. This includes adding any number of exercises to a routine. Filling out those exercises with multiple sets and adding songs to the routine.

Muve is written in the Dart/Flutter framework. It's been developed and tested using VS Code on MacOS running in the iOS *(iPhone 15 Pro Max)* simulator.

The first screen you'll see after launching Muve is the login page. Here you can enter the following credentials for the test user:

Email: `user@test.com`

Password: `test`

Along the bottom is a NavigationBar widget used to navigate between all the primary pages. After logging in, it defaults to the **Home** page, where you'll see a list of your most recent routines. Clicking on the **Library** button on the NavigationBar will show you a scrollable list of all your routines.

Clicking on the **Compose** add-circle in the center of the NavigationBar will bring you to the first key task that has been implemented. 

At the top center of this page you can enter the name of a new routine:

Name: `new routine`

Under the name are two buttons, one for adding exercises and one for adding music. You can select either one to navigate to the Add Exercise page or Add Music page, respectively. A back button will appear on the top of the page, to easily toggle back and forth between adding exercises and adding music.

At the **Add Exercise** page you'll see text fields for entering the name of the exercise.

Name: `bicep curl`

The next line is the first set, where you can enter weight, reps, duration.
Each of these fields are optional, so you only have to enter details relevant to your exercise. In this example, we will fill all three: 

Weight: `20`

Reps: `10`

Duration `1 min`


<img width="285" alt="Screenshot 2023-11-15 at 08 44 31" src="https://github.com/maxhayes17/Muve/assets/99774165/64f427e7-dde9-4ec2-a4f9-d72175d97155">

Each exercise card has a button to add a new set. And a right-to-left swipe will delete the card.

At the bottom of the list are buttons to add another exercise or add music. Pressing the Add Music button will navigate to the Add Music page.

On the **Add Music** page, you will be able to see exercises currently in your routine, and search for a song by title ('Song 1' through 'Song 6' currently available) to go along with your exercises. Tapping on a song in from a search will add it to the routine.

Search: `Song 3`

<img width="310" alt="Screenshot 2023-11-15 at 08 51 43" src="https://github.com/maxhayes17/Muve/assets/99774165/cb5aca55-9699-4a3b-8b04-93313505fa0f">

Long pressing on a song in a routine will bring up a popup to remove the song from the routine.

Pressing the **Create routine** button at the bottom of the page will add the routine to the user’s library and automatically route back to the home screen. From there you can see that the routine has been added and is one of the most recently created. Clicking on the Library button, you'll also see the new routine.
