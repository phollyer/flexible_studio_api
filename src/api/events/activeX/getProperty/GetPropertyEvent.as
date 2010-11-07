package api.events.activeX.getProperty
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class GetPropertyEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_OBJECT:String = "missingObject";
		public static const MISSING_PROPERTY:String = "missingProperty";
		public static const RESULT:String = "result";
		
		public var propertyVal:Object = null;
		
		public function GetPropertyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetPropertyEvent = new GetPropertyEvent( type );
			e.propertyVal = propertyVal;
			return e;
		}
	}
}