# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

#---My Solution---

p advice.include?('Dino')

#---LS Solution---

advice.match?("Dino")

# Note that this is not a perfect solution, as it would match any substring with Dino in it.