package api.events.app.enableFlashMenu
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class EnableFlashMenuEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function EnableFlashMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnableFlashMenuEvent = new EnableFlashMenuEvent( type );
			return e;
		}
	}
}