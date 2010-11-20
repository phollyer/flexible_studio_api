package api.popup.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.popup.notifiers.ClearNotifyEvent;
	import api.popup.Popup;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Popup
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
					ssCore.Popup.clearNotify( {event:event}
											 ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"31014"} );
			}
		}
	}
}