package api.events.activeX.callMethod
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class CallMethodEvent extends ActiveXEvent
	{		
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