package api.events.flash.allowFullScreen
{
	import flash.events.Event;
	
	import api.events.flash.FlashEvent;

	public class AllowFullScreenEvent extends FlashEvent
	{
		
		public function AllowFullScreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AllowFullScreenEvent = new AllowFullScreenEvent( type );
			return e;
		}
	}
}