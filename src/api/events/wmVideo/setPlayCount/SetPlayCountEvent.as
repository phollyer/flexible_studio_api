package api.events.wmVideo.setPlayCount
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetPlayCountEvent extends WmVideoEvent
	{
		
		public function SetPlayCountEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPlayCountEvent = new SetPlayCountEvent( type );
			return e;
		}
	}
}