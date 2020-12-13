# Testing TODOS APP
This is an example on how to test web application with Robotframework and SeleniumLibrary.

### 1. Introduction
[Robot Framework](http://robotframework.org) is an open source automation framework for acceptance testing, acceptance test driven development (ATDD), and robotic process automation (RPA). It has simple plain text syntax (keyword-driven) and it can be extended easily with libraries implemented using Python or Java.

Robot Framework is operating system and application independent. The core framework is implemented using [Python](http://python.org.org), supports both Python 2 and Python 3, and runs also on Jython (JVM), IronPython (.NET) and PyPy. The framework has a rich ecosystem around it consisting of various generic libraries and tools that are developed as separate projects. For more information about Robot Framework and the ecosystem, see http://robotframework.org.
- [GitHub](http://github.com/robotframework/robotframework)
- [PyPI](http://pypi.python.org/pypi/robotframework)
- [Maven central](http://search.maven.org/#search%7Cga%7C1%7Ca%3Arobotframework)
------------------------------------------------------------
### 2. Installation
To understand how the framewoork works and the logic of my project you have to follow installation instractions step by step. If you have evrything setup just download the project in ZIP format and verify it in any Editor.

#### 2.1 Python and pip
In this project we will be using [Python3](https://www.python.org/downloads/). Follow the instractions from the website and install it properly by adding a correct *PATH*. Starting from Python 2.7.9, the standard Windows installer by default installs and activates pip. Now you are ready to install project environment. You can do it by executing *requirements.txt* or following the guide below. 

```sh
$ pip install -r requirements.txt
```

Recommended installation method for Robot framework is using pip: 
```sh
$ pip install robotframework

#upgrade to the latest version
$ pip install --upgrade robotframework
```
------------------------------------------------------------
#### 2.3 PyCharm Editor and Robot plagin

There are a lot of Editors you can use to build your project, I am using [PyCharm Community](https://www.jetbrains.com/pycharm/download/#section=windows). Download and install it. After installing PyCharm, don't forget to install *Intellibot plugin*(@patched for SeleniumLibrary). To install plugin launch PyCharm -> Open File -> Settings dialog -> Click on Plugins -> Search for & install Intellibot and restart PyCharm.

#### 2.4 Desired browsers and Selenium Library

In order to work with Selenium Library we have to install and download Selenium Web drivers. The whole list of supported drivers is listed [here](https://selenium.dev/documentation/en/webdriver/driver_requirements/#quick-reference) but in this project I am using only *Firefox.* [Download Firofox driver](https://github.com/mozilla/geckodriver/releases) -> create special folder to place it in (e.g.C:\bin) -> add this folder to the *PATH*. When you run tests it will know where to take drivers. The same you can for any other driver you want to use. 

To install Selenium Library use pip:

```sh
$ pip install robotframework-seleniumlibrary
```

To use SeleniumLibrary in Robot Framework tests, the library needs to first be imported using the *Library* setting. This should be done for all test cases where you use it. The library accepts some import time arguments, which are documented in the keyword documentation along with [all the keywords](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) provided by the library(e.g.*Open Browser, Input Text, Click Element, Execute Javascript*).

------------------------------------------------------------

#### 2.5 Internal Libraries

By default Robot framework goes with Standart libraries which you don't have to install: Builtin, OperatingSystem, String, Processes, Dialogs, Remote, Telnet, DateTime, Collections, Screenshot and XML.I used Built-In Library.
- ***Built-In Library*** - provides a set of often needed generic keywords. Always automatically available without imports.The provided keywords can be used, for example, for verifications (e.g. Should Be Equal, Should Contain), conversions (e.g. *Convert To Integer*) and for various other purposes (e.g. *Log, Sleep, Set Global Variable, Should be equal*).	
- ***String*** - library for manipulating strings and verifying their contents.
------------------------------------------------------------
### 3.How to execute tests

There are several ways of executing tests(from PyCharm, command line, Task Scheduler, batch file or you can congifure Jenkins). In this project we will run them in 2 ways: from PyCharm and command line. In order to execute tests from PyCharm open Termanal window -> swich to directory where your test are located (e.g. *C:\Users\GitHub\RobotFramework-tutorial\Tests*) -> and execute 

```sh
robot testName.robot
```
After every test execution it creates a report.html, by default this report is added to Tests folder. If you want the results to be in another folder specify it by executing
```sh
robot -d folderForResults testName.robot
```
*Results* folder will be created during execution uder Tests directory or you can create a folder and specify it during execution (exeting should be done from Project folder)
```sh
robot -d Results Tests\testName.robot
```
------------------------------------------------------------

