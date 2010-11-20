package api.events.app.showFolderBrowser
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowFolderBrowserEvent extends AppEvent
	{
		/**
    * The ShowFolderBrowserEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>folderPath</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT:String = "result";		
		public var folderPath:String = null;
		
		public function ShowFolderBrowserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowFolderBrowserEvent = new ShowFolderBrowserEvent( type );
			e.folderPath = folderPath;
			return e;
		}
	}
}