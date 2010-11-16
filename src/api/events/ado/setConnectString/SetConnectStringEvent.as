package api.events.ado.setConnectString
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetConnectStringEvent extends AdoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_CONNECT_STRING:String = "missingConnectString";
		
		public function SetConnectStringEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetConnectStringEvent = new SetConnectStringEvent( type );
			return e;
		}
	}
}