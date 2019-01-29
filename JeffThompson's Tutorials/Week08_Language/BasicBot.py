
'''
BASIC BOT
Jeff Thompson | 2017 | jeffreythompson.org

With some basic Python code, we can build a generative bot! 
In this example, we pick some random words from three corpora 
(lists of text) and merge them using a sentence template. 
See the 'PostingToTwitter' example for how to build on this
and post automatically to your feed.

CHALLENGES
1. Experiment with the template, or build your own!
2. Can you make several templates that get chosen at random? (Hint: use
   the random library's random.random() method to get a number between
   0-1 to drive an if/else conditional like we did in the Randomness
   examples.)

'''

import random  			# for selecting random elements from lists

# we'll use a template to define the bot's post:
# The <animal> <verb> through the <place>.

# some lists for our bot
animals = [ 'fish', 'cat', 'zebra', 'sparrow', 'pterodactyl' ]
verbs =   [ 'waltzed', 'ran', 'crept', 'soared', 'swam' ]
places =  [ 'hotel', 'park', 'Louvre', 'sun' ]

# pick random values to fit in our template
animal = random.choice(animals)
verb =   random.choice(verbs)
place =  random.choice(places)

# fill in the template and build our tweet as a string
tweet = 'The ' + animal + ' ' + verb + ' through the ' + place + '.'
print tweet

