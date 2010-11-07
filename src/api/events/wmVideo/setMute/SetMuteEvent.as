package api.events.wmVideo.setMute
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetMuteEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetMuteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetMuteEvent = new SetMuteEvent( type );
			return e;
		}
	}
}