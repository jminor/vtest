module main

import os
import rand

fn get_input(prompt string) string {
	$if emscripten ? {
		// TODO: make this use Javascript API?
		return (rand.int_in_range(1, 101)).str()
	}$else{
		return os.input(prompt)
	}
}

fn main() {
	println('Welcome!')
	println('')
	name := get_input('What\'s your name? ')
	println('Hello $name! Let\'s get started.')
	number := rand.int_in_range(1, 101)
	println('I\'ve picked a number between 1 and 100. You need to guess it.')
	mut num_guesses := 0
	for {
		guess := get_input('Guess a number: ').int()
		if guess < 1 || guess > 100 {
			println("That's not a valid number. It is a whole number between 1 and 100. Try again.")
		}else if guess < number {
			num_guesses += 1
			println("Too low! Try again.")
		}else if guess > number {
			num_guesses += 1
			println("Too high! Try again.")
		}else if guess == number {
			num_guesses += 1
			println("You got it! We have a winner!!!")
			break
		}else{
			println("That's not a valid number. Try again.")
		}
	}
	println("You got it in $num_guesses guesses. Not bad. See you next time, $name!")
}
