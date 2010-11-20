package api.events.ado.setOrderBy
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetOrderByEvent extends AdoEvent
	{
		
    /**
    * The SetOrderByEvent.COMPLETE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>complete</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType complete
    */
		public static const COMPLETE:String = "complete";
		
		public function SetOrderByEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetOrderByEvent = new SetOrderByEvent( type );
			return e;
		}
	}
}