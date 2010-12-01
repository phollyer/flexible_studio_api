package api.events.splash.notifiers
{
	import flash.events.Event;
	
	import api.events.splash.SplashEvent;

	public class OnFSCommandEvent extends SplashEvent
	{
		
	/**
	* The OnFSCommandEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>args</td><td>null</td></tr>
	* 
	* <tr><td>command</td><td>null</td></tr>
	* 
	* <tr><td>result</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
	/**
	* The OnFSCommandEvent.STATUS constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>status</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>args</td><td>null</td></tr>
	* 
	* <tr><td>command</td><td>null</td></tr>
	* 
	* <tr><td>result</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType status
	*/
		public static const STATUS:String = "status";
		
		public var args:String = null;
		public var command:String = null;
		public var result:String = null;
		
		public function OnFSCommandEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnFSCommandEvent = new OnFSCommandEvent( type );
			e.args = args;
			e.command = command;
			e.result = result;
			return e;
		}
	}
}