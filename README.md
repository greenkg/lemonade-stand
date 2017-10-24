# Lemonade Stand

### Overview

This is a text-based ruby version of the class Lemonade Stand game.

### Game play basics

You are the proprietor of a small lemonade stand. You have 30 days to try to make a profit. Your final score is your net profit at the end of the 30 days.

### Game play I need to create

#### Game

- [ ] Display player score when game ends

#### Basic Player Actions

- [x] Make lemonade - makes one pitcher with set recipe
- [x] Buy lemons - returns one lemon
- [x] Buy sugar - returns one cup of sugar
- [x] Buy ice - returns one bag of ice
- [x] Buy cups - returns 20 cups
- [x] Track player cash
- [ ] Track player profit

#### More Complex Player Actions

- [ ] Buy x lemons (cups of sugar/bags of ice/cups)

#### Basic Day Operations

- [x] Sell a random number of cups of lemonade
- [x] Deplete supplies of lemonade & cups for amount sold
- [x] Record income!

#### More Complex Day Operations

- [ ] Deplete all ice (melted)
- [ ] Deplete random number of spoiled lemons
- [ ] Have an event affect the number of customers

#### Basic World Operations

- [ ] Keep track of what day it is, so game can end after 30 days.

#### More complicated features to be broken down:

- [ ] Change lemonade recipe (player?)
- [ ] Have a popularity score that changes based on customer enjoyment (world?)
- [ ] Have customer enjoyment affected by lemonade recipe (day?)
- [ ] Include random weather and random other events to affect number of customers (world? day?)
- [ ] Ability to change price per cup, which should affect # of customers, or customer enjoyment (although, does paying more actually make the customers like it more?)

### RSpec Testing