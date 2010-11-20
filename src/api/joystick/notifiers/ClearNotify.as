package api.joystick.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.joystick.notifiers.ClearNotifyEvent;
	import api.joystick.Joystick;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Joystick
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
					ssCore.Joystick.clearNotify( {event:event}
												,{callback:actionComplete, errorSTR:"clearNotifyError", code:"24011"} );
			}
		}
	}
}