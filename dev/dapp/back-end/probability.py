import random

def world(a, b):
	event = random.betavariate(a, b)
	if event > 0.5:
		return 'weave'
	else: 
		return 'grainshade'