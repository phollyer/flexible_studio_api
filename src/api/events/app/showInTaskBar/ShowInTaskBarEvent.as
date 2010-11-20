package api.events.app.showInTaskBar
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowInTaskBarEvent extends AppEvent
	{
		
    /**
    * The ShowInTaskBarEvent.COMPLETE constant defines the value of the
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
		
		public function ShowInTaskBarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowInTaskBarEvent = new ShowInTaskBarEvent( type );
			return e;
		}
	}
}