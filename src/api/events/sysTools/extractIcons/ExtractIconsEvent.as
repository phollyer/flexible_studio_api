package api.events.sysTools.extractIcons
{
	import flash.events.Event;
	
	import api.events.sysTools.SysToolsEvent;

	public class ExtractIconsEvent extends SysToolsEvent
	{
		/**
	* The ExtractIconsEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>icoFiles</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var icoFiles:Array = null;
		
		public function ExtractIconsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ExtractIconsEvent = new ExtractIconsEvent( type );
			e.icoFiles = icoFiles;
			return e;
		}
	}
}