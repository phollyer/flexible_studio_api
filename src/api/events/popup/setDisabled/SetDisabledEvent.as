package api.events.popup.setDisabled
{
	import flash.events.Event;
	
	import api.events.popup.PopupEvent;

	public class SetDisabledEvent extends PopupEvent
	{
		/**
	* The SetDisabledEvent.INVALID_FLAG constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>invalidFlag</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType invalidFlag
	*/
		public static const INVALID_FLAG:String = "invalidFlag";
		
		public function SetDisabledEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetDisabledEvent = new SetDisabledEvent( type );
			return e;
		}
	}
}