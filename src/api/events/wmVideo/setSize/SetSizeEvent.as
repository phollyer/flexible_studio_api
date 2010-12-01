package api.events.wmVideo.setSize
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetSizeEvent extends WmVideoEvent
	{
		
		public function SetSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetSizeEvent = new SetSizeEvent( type );
			return e;
		}
	}
}