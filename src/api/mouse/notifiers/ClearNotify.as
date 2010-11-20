package api.mouse.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.mouse.notifiers.ClearNotifyEvent;
	import api.mouse.Mouse;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Mouse
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
					ssCore.Mouse.clearNotify( {event:event}
											 ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"29013"} );
			}
		}
	}
}