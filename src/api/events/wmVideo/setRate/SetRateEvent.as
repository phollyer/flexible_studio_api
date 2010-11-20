package api.events.wmVideo.setRate
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetRateEvent extends WmVideoEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetRateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetRateEvent = new SetRateEvent( type );
			return e;
		}
	}
}