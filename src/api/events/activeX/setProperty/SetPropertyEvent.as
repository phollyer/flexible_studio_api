package api.events.activeX.setProperty
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class SetPropertyEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_OBJECT:String = "missingObject";
		public static const MISSING_PROPERTY:String = "missingProperty";
		public static const MISSING_VALUE:String = "missingValue";
		
		public function SetPropertyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPropertyEvent = new SetPropertyEvent( type );
			return e;
		}
	}
}