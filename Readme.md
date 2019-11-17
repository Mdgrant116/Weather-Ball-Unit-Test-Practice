## **Protocol Notes**

A protocol is like a CV or certification you have in your resume. When you create protocols, you’re defining requirements. And when your class or struct adopts these protocols, it means that you’re saying you can meet the requirements of using it.

Protools can’t have any curly braces or implementation. 

When your class or struct adopts a protocol, you must conform to all of its stubs and implement them. You’re telling Xcode you have the ability to do something, and Xcode is not going to be happy until you prove that you can do it.

Protocols can be adopted by classes or structures. 

By convention you usually create the protocol in the same class that’s going to be using it.

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

A Typealiase combines two protocols into one.

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

## **Decoding JSON Notes**

JSON stands for JavaScript Object Notation 

The JSON data comes back in the data format, so you’re going to have to parse it into something your app can understand. 

To parse data from the JSON form, you first have to inform the compiler how the data is structured. We can do that by creating a struct! We have to basically break down the structure of the JSON for the compiler to understand what’s going on. Then we can assign it property names and turn it into a swift object. Your struct also has to conform to the decodable protocol.

Create a decodable object. The decode method is throwable, which means that if something goes wrong, it can throw and error message. So you have to mark it with a try keyword. You should also wrap it in a do catch block. This means that you can try and run your code, and if it does throw and error, you can catch it. 

When you’re creating the structures for your JSON to be parsed, you can’t just name the properties anything you want. They have to be written the same way they are displayed in the JSON you’re decoding.

To actually use the data, you’re going to have to return something from the data you’re parsing.

## **Dispatch Queue Notes**

When you try and update your UI from inside a completion handler you’ll get a crash because its not on the main thread. The reason you use a completion handler in the first place is because it handles long running task. These tasks are executed in the background so that we don’t block the UI. If we didn’t, we’d be telling the UI to wait until the process was finished before we let the user do anything, which will make the app look like its completely frozen.

So if you’re trying to update the UI from inside a closure, you have to call the main thread to update the user interface in the background. 

Wrap your UI update in DispatchQueue.main.async like this

    dispatchQueue.main.async {

    self.label.text = “You did the thing!”

    }

## **Extension Notes**

When adding extra capabilities to a project, instead of diving into the original code and ripping things out and putting other things in, you can extend the functionality of the existing code.

To extend something, you would use the extend keyword, and then the type of thing you’re trying to extend. This could be a class, or a struct, or even a protocol. And inside the extension, you would add the new functionality to that type. Something like this.

    extension ViewController {

    // Amazing New Thing

    }

Swift allows you to make new functions out of existing functions as long as they have different parameter names.

To avoid having to write out the same implementation if we wanted, we can define a default implementation by extending a protocol. This is what’s happening when we adopt something like UITextFieldDelegate, which is why Xcode doesn’t try to rip our heads off for not implementing certain protocol stubs. The functionality is optional.

Extensions are also really handy for organizing code, because we can create extensions that adopt different protocols.

## **Cleaning Up Your Code Notes**

You can clean and organize your code in many ways. One of them is splitting up your code into sections using MARK comments. 

    //MARK: - Whatever you want

To make this easier, you can take advantage of code snippets. All you have to do is select the part of the code you want to reuse, right click on it, and go to create code snippet. You can give it a name, and even a summary. 

To call your code snippet, make sure to give it a completion name, and that’s what you’ll type to call it.

## **Dark Mode Notes**

If you use the system colors in your UI, they will automatically update with light or dark mode, however, if you use a custom color, they won’t.

To fix this, go to your assets and create a new color set. Change the appearance to include Any, Light, and Dark. When you select the squares, you get to define a custom color. Choose your colors, and give your color set a name. Select your new color in the attributes inspector.

If you want to select a different background image for light and dark mode, in appearances inside the assets folder, select Any, Light and Dark just like before. 


## **Using Vector Assets Notes**

In the assets inspector, click the image you want, and check the box that says preserve vector data.  Then in the scales section, select single scale.



## **Unit Test Notes**

Whatever code you place inside the setup function will be ran before each test is run.

Teardown is run afer each test. For example if you're writing to a database or writing to a file in your test, after the test has run, remember to use teardown so that whatever has been written won't change the state. Forgetting to do say may impact the result of future tests if the state of what you're testing has changed.

Make sure that when you're writing tests, they're clean. Make sure when you’re writing tests, to only test one thing. Make sure you're removing whatever you're changing in the tests so the results aren't skewed. 
