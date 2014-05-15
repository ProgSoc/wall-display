#Top Lvl for render of components

class Grid
	constructor: (@canvas, @rows, @cols) ->
		@cells = (new ViewPort() for c in [0..@rows*@cols])
		@c2d = @canvas.getContext('2d')
		@__isRendering = false
		
	width: ->
		return @canvas.width
	
	height: ->
		return @canvas.height
		
	render: ->
		if !@__isRendering
			@__isRendering = true
			cellWidth = @width() / @cols
			cellHeight = @height / @rows
			for i, viewport in @cells
				if viewport.needsRender()
					[x, y] = [i%@rows,  Math.floor(i / @rows)]
					@c2d.translate(x, y)
					viewport.render(@c2d)
					@c2d.restore()
			@__isRendering = false
			
window.Grid = Grid
