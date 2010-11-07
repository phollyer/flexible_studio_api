package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnDataEvent extends AppEvent
	{
		public static const STATUS:String = "status";
		
		public var data:String = null;
		
		public function OnDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnDataEvent = new OnDataEvent( type );
			e.data = data;
			return e;
		}
	}
}