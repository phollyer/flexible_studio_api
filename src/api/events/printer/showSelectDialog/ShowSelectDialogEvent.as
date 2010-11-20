package api.events.printer.showSelectDialog
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class ShowSelectDialogEvent extends PrinterEvent
	{
		
	/**
	* The ShowSelectDialogEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>button</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var button:String = null;
		
		public function ShowSelectDialogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowSelectDialogEvent = new ShowSelectDialogEvent( type );
			e.button = button;
			return e;
		}
	}
}