Whatever code you place inside the setup function will be ran before each test is run.

Teardown is run afer each test. For example if you're writing to a database or writing to a file in your test, after the test has ran remember to use teardown so that whatever has been written won't change the state. Forgetting to do say may impact the result of future tests if the state of what you're testing has changed.

Make sure that when you're writing tests, They're clean. Make sure when youre writing tests, to only test one thing. Make sure you're removing whatever you're changing in the tests so the results aren't skewed. 

