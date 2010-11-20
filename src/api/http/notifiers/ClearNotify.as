package api.http.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.ftp.notifiers.ClearNotifyEvent;
	import api.http.Http;

	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Http
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
					ssCore.Http.clearNotify( {event:event}
										   ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"4021"} );
			}
		}
	}
}