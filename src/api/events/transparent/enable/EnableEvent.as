package api.events.transparent.enable
{
	import flash.events.Event;
	
	import api.events.transparent.TransparentEvent;

	public class EnableEvent extends TransparentEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function EnableEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnableEvent = new EnableEvent( type );
			return e;
		}
	}
}