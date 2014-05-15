class ViewPort
	constructor: ()->
		@needsRender(true)
		
	needsRender: (val) ->
		if val?
			@__needsRender = val
		return @__needsRender
		
	#Get/set the size
	size: (w, h) ->
		if w? and h?
			@__size = [w, h]
			@needsRender(true)
		
		return @__size
	
	render: (context) ->
		renderComponent.call(this, context)
			
	renderComponent: (c2d)->
		[w, h] = @size()
		c2d.fillStyle = '#FFFFFF'
		c2d.fillRect(0, 0, w, h)
		c2d.fillStyle = '#000000'
		c2d.drawString("Not Implemented", w/2, h/2)
		
		
module.exports = ViewPort
