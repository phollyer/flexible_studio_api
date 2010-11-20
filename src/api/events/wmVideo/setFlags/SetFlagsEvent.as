package api.events.wmVideo.setFlags
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetFlagsEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetFlagsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetFlagsEvent = new SetFlagsEvent( type );
			return e;
		}
	}
}