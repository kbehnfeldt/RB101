# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

#--- My Solution---

p "Four score and " + famous_words
p "Four score and #{famous_words}"

#---LS Solutions---
"Four score and " + famous_words
famous_words.prepend("Four score and ") # mutates the caller
"Four score and " << famous_words