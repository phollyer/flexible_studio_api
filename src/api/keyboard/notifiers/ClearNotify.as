package api.keyboard.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.keyboard.notifiers.ClearNotifyEvent;
	import api.keyboard.Keyboard;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Keyboard
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
					ssCore.Keyboard.clearNotify( {event:event}
												,{callback:actionComplete, errorSTR:"clearNotifyError", code:"25012"} );
			}
		}
	}
}