package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnDragDropEvent extends AppEvent
	{
		
    /**
    * The OnDragDropEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>fileList</td><td>null</td></tr>
    * 
    * <tr><td>folderList</td><td>null</td></tr>
    * 
    * <tr><td>x</td><td>0</td></tr>
    * 
    * <tr><td>y</td><td>0</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT : String = "result";
		public static const RESULT:String = "result";
		
		public var fileList:Array = null;
		public var folderList:Array = null;
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function OnDragDropEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnDragDropEvent = new OnDragDropEvent( type );
			e.fileList = fileList;
			e.folderList = folderList;
			e.x = x;
			e.y = y;
			return e;
		}
	}
}