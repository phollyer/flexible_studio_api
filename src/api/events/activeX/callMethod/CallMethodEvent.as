package api.events.activeX.callMethod
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class CallMethodEvent extends ActiveXEvent
	{
		/**
    * The CallMethodEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>returnData</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
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