# Animation Menu for REDM

This project provides an animation menu for RedM, built with the VORP framework. It allows you to quickly test various animations from a specific dictionary.

## Installation

1 - Download the project.
2 - Place the project folder in your RedM resource directory.
3 - Add ensure anz_testanimations to your server.cfg file.

### Usage

1 - Visit this link : https://github.com/femga/rdr3_discoveries/tree/master/animations and explore and find the animDict you want to test.
2 - Open the client.lua and go to line 115.
3 - Replace the animDict variable with the name of your desired animation dictionary.
4 - Replace the animations in the animations table with the animations from your chosen animation dictionary.
5 - In the game, open the animation menu by using the /testanime command. This will display a menu with all the animations you added to the animations table.
6 - You can close the animation menu with the BACKSPACE key. 

Ensure that the animation dictionary and animation names are valid and available.
If you encounter any issues, check the error messages in the server or client console for clues about what might be going 