# Oystercard Challenge
-----

## Customer Requirements

```
In order to use public transport
As a customer
I want money on my card
```
```
In order to keep using public transport
As a customer
I want to add money to my card
```
```
In order to protect my money
As a customer
I don't want to put too much money on my card
```
```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```
```
In order to get through the barriers
As a customer
I need to touch in and out
```
```
In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey
```
```
In order to pay for my journey
As a customer
I need to pay for my journey when it's complete
```
```
In order to pay for my journey
As a customer
I need to know where I've travelled from
```
```
In order to know where I have been
As a customer
I want to see to all my previous trips
```
```
In order to know how far I have travelled
As a customer
I want to know what zone a station is in
```
```
In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out
```
```
In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```
-----

## Objects & Attributes
* Oystercard
    - @money
    - LIMIT
    - @in_journey
    - @history
    - @entry_station
    - @exit_station
* Touchpad
    - @location ({:location => 'loc', :zone => 1})
* Journey
  -


## Objects & Methods
* Oystercard
  - top_up
    - method for user to add money
    - guard clause - check money limit constant
  - deduct_money(val)
    - method to remove money when touch in/out
    - value argument to define how much
  - show_balance
  - touch_in
  - touch_out
  - in_journey
  - history
  -
* Touchpad
  - check_min_balance(oystercard)
    - ask oystercard for balance
    - check it is the right level
  - journey_complete(oystercard)
    - calculate touch in touch out
  - touchpad_zone
    - returns location
* Journey
* 
