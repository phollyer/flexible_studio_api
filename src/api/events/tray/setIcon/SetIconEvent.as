package api.events.tray.setIcon
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class SetIconEvent extends TrayEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_RESOURCE:String = "missingResource";
		
		public function SetIconEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetIconEvent = new SetIconEvent( type );
			return e;
		}
	}
}