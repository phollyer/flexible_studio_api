package api.events.wmVideo.notifiers
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class OnScriptCommandEvent extends WmVideoEvent
	{
		
	/**
	* The OnScriptCommandEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>argument</td><td>null</td></tr>
	* 
	* <tr><td>commandType</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
	/**
	* The OnScriptCommandEvent.STATUS constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>status</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>argument</td><td>null</td></tr>
	* 
	* <tr><td>commandType</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType status
	*/
		public static const STATUS:String = "status";
		
		public var argument:String = null;
		public var commandType:String = null;
		
		public function OnScriptCommandEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnScriptCommandEvent = new OnScriptCommandEvent( type );
			e.argument = argument;
			e.commandType = commandType;
			return e;
		}
	}
}