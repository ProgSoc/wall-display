drawCircle = (c2d, x, y, rad) ->
	c2d.beginPath()
	c2d.arc(pos[0], pos[1], rad, 0, 2*Math.PI, false)
	c2d.stroke()
	c2d.fill()

class Clock extends ViewPort
	constructor: ->
		@angles = (
			for time in [0...60]
				angle = Math.PI/2 - 2*Math.PI*time/60
				[Math.cos(angle), Math.sin(angle)])
		
	renderComponent: (c2d) ->
		[w, h] = @size()
		c2d.save()
		c2d.translate(w/2, h/2)
		
		now = Date.now()
		hr  = now.getHours();
		min = now.getMinutes();
		sec = now.getSeconds();
		
		c2d.strokeStyle = '#FFFFFF'
		c2d.fillStyle = '#FF0000'
		drawCircle(c2d, angles[hr*5][0]*w/2, angles[hr*5][1]*h/2, 15)
		
		c2d.fillStyle = '#00FF00'
		drawCircle(c2d, angles[min][0]*w/2, angles[min][1]*h/2, 10)
		
		c2d.fillStyle = '#0000FF'
		drawCircle(c2d, angles[sec][0]*w/2, angles[sec][1]*h/2, 5)
