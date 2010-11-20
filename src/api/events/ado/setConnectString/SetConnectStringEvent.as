package api.events.ado.setConnectString
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetConnectStringEvent extends AdoEvent
	{		
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