package api.events.ado.getRecordCount
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class GetRecordCountEvent extends AdoEvent
	{
		
    /**
    * The GetRecordCountEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>recordCount</td><td>0</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT : String = "result";
		public static const RESULT:String = "result";
		
    /**
    * The GetRecordCountEvent.COMPLETE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>complete</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>recordCount</td><td>0</td></tr>
    * 
    * </table>
    *
    * @eventType complete
    */
		public static const COMPLETE:String = "complete";
		
		public var recordCount:Number = 0;
		
		public function GetRecordCountEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetRecordCountEvent = new GetRecordCountEvent( type );
			e.recordCount = recordCount;
			return e;
		}
	}
}