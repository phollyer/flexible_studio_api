package api.events.guides.create
{
	import flash.events.Event;
	
	import api.events.guides.GuidesEvent;

	public class CreateEvent extends GuidesEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_GUIDE_NAME:String = "missingGuideName";
		public static const INVALID_ORIENTATION:String = "invalidOrientation";
		public static const MISSING_OFFSET:String = "missingOffset";
		public static const MISSING_ORIENTATION:String = "missingOrientation";
		
		public function CreateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CreateEvent = new CreateEvent( type );
			return e;
		}
	}
}