eu = require('./util')
Canvas = require('../lib/canvas')

canvas = new Canvas(500, 500)
ctx = canvas.getContext('2d')

render = ->
	ctx.fillStyle = "#FF0000"
	ctx.fillRect(200, 200, 50, 50)

requestAnimationFrame(render)

process.stdin.pause()

eu.waitForInput()
