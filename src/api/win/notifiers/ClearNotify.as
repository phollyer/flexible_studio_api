package api.win.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.win.notifiers.ClearNotifyEvent;
	import api.win.Win;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Win
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
					ssCore.Win.clearNotify( {event:event}
										   ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"6042"} );
			}
		}
	}
}