package api.events.wmVideo.setResource
{
	import flash.events.Event;
	
	import api.events.wmVideo.WmVideoEvent;

	public class SetResourceEvent extends WmVideoEvent
	{
		
		public function SetResourceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetResourceEvent = new SetResourceEvent( type );
			return e;
		}
	}
}