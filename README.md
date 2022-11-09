# Marketplacer Coding Challenge

## About The Challenge

Written in Ruby, the challenge for this coding test is to create a simple CLI marketplace application for Marketplacer. The application will have a list of products where users can select which item to add into their cart. User can also view their cart with the option to remove items from the cart. The cart display will show the price total of selected items along with the discounted total price if applicable.

## Getting Started

To get the repo running on your local machine:
1. Clone this repo:
```
git clone https://github.com/j-tws/marketplacer-coding-challenge.git
```

2. cd into the folder:
```
cd marketplacer-coding-challenge
```

3. Run bundle install:
```
bundle install
```

4. Use Ruby to open the main ruby file:
```
ruby main.rb
```

## In The App

Once you run `ruby main.rb`, you should see the following display:

```
Welcome to Marketplacer!
The marketplace's list of products:
----------------------------------------------
1. Item: Jockey Wheels - Orange, Price: 15.39
2. Item: Chain Ring 146mm, Price: 65.95
3. Item: Carbon Brake Pads, Price: 92.00
4. Item: Front Derailleur - 34.9mm, Price: 31.22
----------------------------------------------
Please select an option to proceed:
1. Add item to cart
2. View cart
3. Exit app
```

Just follow the display prompt and key in the numbers on which option you will like to perform. 

## Thought Process

I approached the challenge by first planning out the basic functions needed for a marketplace to work. I then realized that there are essential aspects to this challenge that I will need to cover:

#### Seperation of Concerns

The overall structure is seperated into two parts:
  * The business logic which is contained in `class Marketplace`
  * The display UI logic which is contained in `class App`

The `class Marketplace` handles all necessary calculation and interactions on the data (products). It contains essential methods that are typically needed in a checkout system. Such methods includes logic that adds / remove item from cart, calculate the total amount in the cart, and also the total amount after discount if applied. 

The `class App` handles how the graphical UI is displayed and how to direct the user from one prompt to another. The user will also then perform a series of commands according to the instructions displayed. 

Seperation of concerns is a common practice in computer science as it is a form of abstraction. It also promotes better simplification, independent development, and maintenance of code. Having this approach in this challenge definitely increased my understanding towards seperation of concerns.

#### Test Driven Development

Test Driven Development (aka TDD) is something I give a lot on emphasis on as it is something I personally want to be very, very strong at. Writing good tests makes me more confident in writing development/production code and I do enjoy writing them! Nothing is more pleasing than seeing green dots / ticks being passed in test.

For this challenge I used `RSpec` which is a standard testing tool for Ruby. For `class Marketplace` I've written a series of tests for both happy and sad paths. Tests for this class is written more rigorously as it is the main business logic layer for this app.

For the `class App` I still yet to fully understand how to write tests for a CLI display application. For now the test that I've managed to write through research is to test for basic user inputs. This is something I will definitely need to add into my to-learn list.

#### User Experience

I give some focus on to user experience for this CLI app just so the user can use the app with more ease, especially when a CLI app can potentially be lost in a sea of texts. I've implemented simple strategies such as coloring / highlighting important texts, sending out an error message if there are any, and clear instructions for the user to input. 

## Thinking out Loud Area!!


