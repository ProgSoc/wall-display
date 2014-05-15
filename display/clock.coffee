ViewPort = require('./ViewPort')

drawCircle = (c2d, x, y, rad) ->
	c2d.beginPath()
	c2d.arc(x, y, rad, 0, 2*Math.PI, false)
	c2d.stroke()
	c2d.fill()

class Clock extends ViewPort
	constructor: ->
		@angles = (
			for time in [0...60]
				angle = 3*Math.PI/2 + 2*Math.PI*time/60
				[Math.cos(angle), Math.sin(angle)])
		
	renderComponent: (c2d) ->
		[w, h] = @size()
		
		c2d.save()
		c2d.translate(w/2, h/2)
		
		c2d.fillStyle = '#FFFFFF'
		drawCircle(c2d, 0, 0, w/2)		

		#c2d.fillStyle = '#000000'
		#for n in [0, 15, 30, 45]
		#	drawCircle(c2d, @angles[n][0]*w/2, @angles[n][1]*h/2, 20)

		now = new Date()
		hr  = now.getHours();
		min = now.getMinutes();
		sec = now.getSeconds();
		
		c2d.strokeStyle = '#000000'
		c2d.fillStyle = '#FF0000'
		drawCircle(c2d, @angles[hr*5][0]*w/2, @angles[hr*5][1]*h/2, 100)
		
		c2d.fillStyle = '#00FF00'
		drawCircle(c2d, @angles[min][0]*w/2, @angles[min][1]*h/2, 50)
		
		c2d.fillStyle = '#0000FF'
		drawCircle(c2d, @angles[sec][0]*w/2, @angles[sec][1]*h/2, 25)
		
		c2d.restore()
		
module.exports = Clock
