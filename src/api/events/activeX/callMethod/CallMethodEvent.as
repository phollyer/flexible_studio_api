package api.events.activeX.callMethod
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class CallMethodEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_METHOD:String = "missingMethod";
		public static const MISSING_OBJECT:String = "missingObject";
		public static const RESULT:String = "result";
		
		public var returnData:Object = null
		
		public function CallMethodEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CallMethodEvent = new CallMethodEvent( type );
			e.returnData = returnData;
			return e;
		}
	}
}