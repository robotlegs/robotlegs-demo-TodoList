# Todo Example

Very simple example of a todo list application developed using Apache Flex 4.8 and the very latest version of Robotlegs.

## Frameworks & Libraries

Below is a list of frameworks & libraries used for the project.

* [Apache Flex 4.9](http://incubator.apache.org/flex/)
* [Robotlegs 2 Beta 5](https://github.com/robotlegs/robotlegs-framework/) *(built using the latest source code from [27th February 2013](https://github.com/robotlegs/robotlegs-framework/commit/8c223f17ac90ce18f41bb1a340b292750aba111d))*
* [FlexUnit 4.1.0.16076](https://github.com/flexunit/flexunit/)
* [Mockito 1.4M5](https://bitbucket.org/loomis/mockito-flex/)
* [Hamcrest 1.1.3](https://github.com/drewbourne/hamcrest-as3)
* [AS3 Signals 0.9 BETA](https://github.com/robertpenner/as3-signals/) *(built using the Apache Flex 4.8 SDK.)*
* [AS3 Signals Utilities 0.9 BETA](https://github.com/eidiot/as3-signals-utilities-async) *(built using the Apache Flex 4.8 SDK.)*
* [SignalCommandMap Robotlegs Extension](https://github.com/pixels4nickels/robotlegs-extensions-SignalCommandMap) *(built using the latest source code from 1st November 2012)*

## Specification

* User can add a task to the todo list.
* User can delete an existing task from the todo list.
* User can modify an existing task from the todo list.
* User is presented a message notify that there are no tasks when the todo list is empty.
* User can't enter a task that has no description.

## Testing

The project is covered with tests wherever possible. In order to run the tests you must have ant installed. To run the tests simply navigate your current directory to the *build* directory and then run the command displayed below.

	ant test

This will compile the code and execute the test runner. It also outputs a JUnit report to a deploy folder. Should be noted that you may need to change the path to your Flex SDK, which can be done by changing the *FLEX_HOME* property in the [build/build.properties](https://github.com/peterkeating/todolist-example/blob/master/build/build.properties).

## Feedback or Questions

This code is not perfect, and I'm sure you would do things different and I would love to know what changes you'd make or what you would do differently. Send me an email at [peter@moov2.com](mailto:peter@moov2.com) or a tweet to [@peterkeating](http://twitter.com/peterkeating).
