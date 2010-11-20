package api.printer.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.printer.notifiers.ClearNotifyEvent;
	import api.printer.Printer;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Printer
	{
		// Required
		public var event:String = null;
		
		public function ClearNotify(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clearNotify( notificationEvent:String = null ):void
		{
			event = compareStrings( notificationEvent , event );
			
			switch( event )
			{
				case null:
					missingEvent();
					break;
				default:
					ssCore.Printer.clearNotify( {event:event}
											   ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"32012"} );
			}
		}
	}
}