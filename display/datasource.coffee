#
#Class for listener of incoming data
#Maybe slightly drunk
#

#Base code for origin of data
#Extend this class when your class needs data
#Which is always
class DataSource
	constructor: (@dataSource) ->
		@dataSource ?= -> #No Data
		@listeners = []

	notifyListeners: (newData) ->
		l.onData(newData, this) for l in @listeners
		
	addListener: (l) ->
		@listeners.append(l)
		
	die: ->
		@dataSource = null
		
#Used when your data is Time. An example of this is a clock
#If what you want is to request data (say a system call every 30 seconds)
#this is not your time
#
class TimeDataSource extends DataSource
	
	#Interval is in milliseconds
	constructor: (@interval) ->
		@__stop = false
		@__lastTimeoutId = -1
		super do ->
			lastTime = Date.now()
			return =>
				if !@__stop
					curTime = Date.now()
					dif = curTime - lastTime
					lastTime = curTime
					@notifyListeners(dif)
					@__lastTimeoutId = setTimeout((->@dataSource.call(this)), @interval)

	die: ->
		clearInterval(@__lastTimeoutId)
		@__stop = true

#This datasource requests data at a set period
#Use this for requesting data from a server every n minutes or
#a system call every 30s
class IntervalDataSource extends DataSource
	constructor: (@onInterval, @interval) ->
		@__stop = false
		@__lastTimeoutId = -1
		super =>
			if !@__stop
				onInterval()
				@__lastTimeoutId = setTimeout((->@onInterval.call(this)), @interval)

#Export the classes				
for n in ["DataSource", "IntervalDataSource", "TimeDataSource"]
	window[n] = eval(n)
