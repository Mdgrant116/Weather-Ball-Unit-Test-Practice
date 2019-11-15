Unit Test Notes

Whatever code you place inside the setup function will be ran before each test is run.

Teardown is run afer each test. For example if you're writing to a database or writing to a file in your test, after the test has ran remember to use teardown so that whatever has been written won't change the state. Forgetting to do say may impact the result of future tests if the state of what you're testing has changed.

Make sure that when you're writing tests, They're clean. Make sure when youre writing tests, to only test one thing. Make sure you're removing whatever you're changing in the tests so the results aren't skewed. 

Dark Mode Notes

if you use the system colors in your UI, they will automatically update with light or dark mode, however, if you use a custom color, they wont.

To fix this, go to your assets and create a new color set. Change the appearance to include any, Light, and Dark. When you select the squares, you get to define a custom color. Choose your colors, and give your color set a name. Select your new color.

if you want to select a different background image for light and dark mode, in appearances, select any, light and dark just like before. 



Using Vector Assets

In the assets inspector, click the image you want, and check the box that says preserve vector data.  Then in the scales section, select Single Scale
