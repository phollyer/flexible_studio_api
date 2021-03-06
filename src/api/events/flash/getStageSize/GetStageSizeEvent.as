package api.events.flash.getStageSize
{
	import flash.events.Event;
	
	import api.events.flash.FlashEvent;

	public class GetStageSizeEvent extends FlashEvent
	{
		
	/**
	* The GetStageSizeEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var height:Number = -1;
		public var width:Number = -1;
		
		public function GetStageSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetStageSizeEvent = new GetStageSizeEvent( type );
			e.height = height;
			e.width = width;
			return e;
		}
	}
}