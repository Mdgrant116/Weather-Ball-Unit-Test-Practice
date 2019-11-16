## **Protocol Notes**

A protocol is like a CV or certification you have in your resume. When you create protocols, you’re defining requirements. And when your class or struct adopts these protocols, it means that you’re saying you can meet the requirements of using it.

Protools can’t have any curly braces or implementation. 

When your class or struct adopts a protocol, you must conform to all of its stubs and implement them. You’re telling Xcode you have the ability to do something, and Xcode is not going to be happy until you prove that you can do it.

Protocols can be adopted by classes or structures. 

Sometimes protocols are more appropriate to use than class inheritance because there may be a case where you’ll want the adopted class or struct to have the ability to some things, but not others. For example if you had a bird class, and gave them the ability to fly, you’d run into a situation where you may have an eagle, or a sparrow who can fly, and a penguin who is also a bird, but can’t fly. In this case inheritance may not be the best option for you. The same is true for birds that can swim, but not fly, or birds that can do neither, like a rooster. In this situation you could create a protocol with a can fly method, and apply it to only the birds that need the functionality, instead of giving it to the bird class as a whole.

You can adopt multiple protocols. If you’re inheriting from a class, the superclass comes first, then the protocols.

## **Delegate Notes**

A design pattern is just a proven solution to a common problem.

Underlying the delegate pattern are protocols. So for example, we can create a protocol called canDealWithUITextFields and we can define in the protocol body some required methods. For example, every class that says that it CanDealWithUITextFields has to implement the method textFieldDidBeginEditing.

Protocol UITextFieldDelegate {

    func textFieldDidBeginEditing()
}

After we adopt this protocol in our class, we need to create a delegate property with a required type.

var delegate: UITextFieldDelgate

In order to set a class or a struct as the delelage it must conform to the delegate protocol of the same type. This is to ensure that you can actually do the things that need to be done. It can safely call a method like textFieldDidBeginEditing() because it knows that you were required to conform.

For your controller to know about the delegate, your controller has to have an object. For instance.

let textField = UITextField()

Now that we have a textfield created from this reusable blue print of a UITextfield we can set its delegate as self.

textField.delegate = self 

The sequence of events that happens when you fun your app is first run the app is the line where you created the textfield from the reusable template.

let textField = UITextField()

Next we set that textFields delegate property to self.

textField.delegate = self 

The next thing that would happen is at some point the delegate will detect that the user has starting typing something in the textfield.

func textFieldDidBeginEditing() {

//fancy code 

}

## **API Notes**

API stands for application Programming Interface.

You can consider it as a set of commands, functions, protocols, and objects. They can be used to create software or interact with an external system.

It provides the developers with standard commands for performing common operations so they don’t have to write the code from scratch.

For example when working with apple documentation, you use the API reference like AVAudioPlayer, and the standard commands for performing operations are things like func play()

In addition to using APIs to create software, there are also APIs to interact with an external systems.

You can consider an API as a contract between the developer and the API provider. In this app I’m using OpenWeathers API to provide the weather information. And Im basically entering into a contract. Saying I’ll use the methods they provide, and I’ll follow the rules they set out in the docs, and in return they’ll promise to keep all the requirements the same so that my app never crashes because somethings changed.

## **Networking Notes**

Networking is what happens when your app is talking to a webserver. The webserver is like an app in its self, and what we’re trying to do is talk to the open weathermap server and make a request for the data. As a part of the request, we pass over some of the queries for the data we want. An example would be the name of the city who’s weather we would like to get back.

When the web server looks at your query, if it can recognize it, the web server will send a response  with the data you requested. This whole process s called networking. In Swift, when we wanter to perform some networking, there are a few steps we have to go through. 

First we have to create a URL, then we create a URL Session. This is going to be the object doing our networking. Then we have to give the URL Session a task. The final step is to start the task, which triggers the entire process to begin. I’ve made notes of this in the WeatherManager file.

When you start a task, they begin in a suspended state, so you need to call your task with a .resume()

## **Dark Mode Notes**

If you use the system colors in your UI, they will automatically update with light or dark mode, however, if you use a custom color, they won’t.

To fix this, go to your assets and create a new color set. Change the appearance to include Any, Light, and Dark. When you select the squares, you get to define a custom color. Choose your colors, and give your color set a name. Select your new color in the attributes inspector.

If you want to select a different background image for light and dark mode, in appearances inside the assets folder, select Any, Light and Dark just like before. 


## **Using Vector Assets**

In the assets inspector, click the image you want, and check the box that says preserve vector data.  Then in the scales section, select single scale.

## **Unit Test Notes**

Whatever code you place inside the setup function will be ran before each test is run.

Teardown is run afer each test. For example if you're writing to a database or writing to a file in your test, after the test has run, remember to use teardown so that whatever has been written won't change the state. Forgetting to do say may impact the result of future tests if the state of what you're testing has changed.

Make sure that when you're writing tests, they're clean. Make sure when you’re writing tests, to only test one thing. Make sure you're removing whatever you're changing in the tests so the results aren't skewed. 
