eu = require('./util')
Canvas = require('../lib/canvas')
Clock = require('./clock')

canvas = new Canvas(500, 500)
ctx = canvas.getContext('2d')
ctx.translate(50, 50)

c = new Clock()
console.log(c)
for a, b in c
	console.log("#{a}:  #{b}")

c.size(500, 500)
c.needsRender(true)

eu.animate(->c.render(ctx))

process.stdin.pause()

eu.waitForInput()
