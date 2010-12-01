package api.events.keyboard.notifiers
{
	import flash.events.Event;
	
	import api.events.keyboard.KeyboardEvent;

	public class OnHotKeyEvent extends KeyboardEvent
	{
		/**
	* The OnHotKeyEvent.CHANGE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>change</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>hotKeyName</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType change
	*/
		public static const CHANGE:String = "change";
		/**
	* The OnHotKeyEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>hotKeyName</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var hotKeyName:String = null;
		
		public function OnHotKeyEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnHotKeyEvent = new OnHotKeyEvent( type );
			e.hotKeyName = hotKeyName;
			return e;
		}
	}
}