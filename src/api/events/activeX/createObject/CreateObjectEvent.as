package api.events.activeX.createObject
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class CreateObjectEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_OBJECT:String = "missingObject";
		public static const MISSING_PROG_ID:String = "missingProgID";
		
		public function CreateObjectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CreateObjectEvent = new CreateObjectEvent( type );
			return e;
		}
	}
}