package api.events.wmVideo.setPosition
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetPositionEvent extends WmVideoEvent
	{
		
		public function SetPositionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPositionEvent = new SetPositionEvent( type );
			return e;
		}
	}
}