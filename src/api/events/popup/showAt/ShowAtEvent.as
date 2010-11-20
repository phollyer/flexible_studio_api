package api.events.popup.showAt
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class ShowAtEvent extends PopupEvent
	{
		
	/**
	* The ShowAtEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>itemID</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var itemID:String = null;
		
		public function ShowAtEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowAtEvent = new ShowAtEvent( type );
			e.itemID = itemID;
			return e;
		}
	}
}