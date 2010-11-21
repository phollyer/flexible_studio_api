package api.events.popup.getMenu
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class GetMenuEvent extends PopupEvent
	{
		/**
	* The GetMenuEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>menu</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var menu:String = null;
		
		public function GetMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetMenuEvent = new GetMenuEvent( type );
			e.menu = menu;
			return e;
		}
	}
}