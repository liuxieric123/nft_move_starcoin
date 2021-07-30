import random

def world(a, b):
	if a > 1:
		a = a / 100
		b = b / 100
	event = random.betavariate(a, b)
	if event > 0.5:
		return 'weave'
	else: 
		return 'grainshade'