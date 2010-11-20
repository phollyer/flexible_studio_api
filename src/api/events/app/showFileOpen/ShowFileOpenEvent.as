package api.events.app.showFileOpen
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowFileOpenEvent extends AppEvent
	{
		
    /**
    * The ShowFileOpenEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>file</td><td>null</td></tr>
    * 
    * <tr><td>fileList</td><td>null</td></tr>
    * 
    * <tr><td>filterMask</td><td>null</td></tr>
    * 
    * <tr><td>filterName</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT : String = "result";
		public static const RESULT:String = "result";
		
    /**
    * The ShowFileOpenEvent.COMPLETE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>complete</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>file</td><td>null</td></tr>
    * 
    * <tr><td>fileList</td><td>null</td></tr>
    * 
    * <tr><td>filterMask</td><td>null</td></tr>
    * 
    * <tr><td>filterName</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType complete
    */
		public static const COMPLETE:String = "complete";
		
    /**
    * The ShowFileOpenEvent.MISSING_FILE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingFileOBJ</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>file</td><td>null</td></tr>
    * 
    * <tr><td>fileList</td><td>null</td></tr>
    * 
    * <tr><td>filterMask</td><td>null</td></tr>
    * 
    * <tr><td>filterName</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType missingFileOBJ
    */
		public static const MISSING_FILE_OBJ:String = "missingFileOBJ";
		
		public var file:String = null;
		public var fileList:Array = null;
		public var filterIndex:Number = -1;
		public var filterMask:String = null;
		public var filterName:String = null;
		
		public function ShowFileOpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowFileOpenEvent = new ShowFileOpenEvent( type );
			e.file = file;
			e.fileList = fileList;
			e.filterIndex = filterIndex;
			e.filterMask = filterMask;
			e.filterName = filterName;
			return e;
		}
	}
}