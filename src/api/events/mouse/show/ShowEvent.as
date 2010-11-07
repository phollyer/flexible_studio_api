package api.events.mouse.show
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class ShowEvent extends MouseEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var displayCounter:Number = -1;
		
		public function ShowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowEvent = new ShowEvent( type );
			e.displayCounter = displayCounter;
			return e;
		}
	}
}