package api.events.app.showFileSave
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowFileSaveEvent extends AppEvent
	{
		/**
    * The ShowFileSaveEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>file</td><td>null</td></tr>
    * 
    * <tr><td>filterMask</td><td>null</td></tr>
    * 
    * <tr><td>filterName</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT:String = "result";		
		public var file:String = null;
		public var filterIndex:Number = -1;
		public var filterMask:String = null;
		public var filterName:String = null;
		
		public function ShowFileSaveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowFileSaveEvent = new ShowFileSaveEvent( type );
			e.file = file;
			e.filterIndex = filterIndex;
			e.filterMask = filterMask;
			e.filterName = filterName;
			return e;
		}
	}
}