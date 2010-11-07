package api.udp.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.udp.notifiers.ClearNotifyEvent;
	import api.udp.Udp;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Udp
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
					ssCore.Udp.clearNotify( {event:event}
										   ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"44007"} );
			}
		}
	}
}