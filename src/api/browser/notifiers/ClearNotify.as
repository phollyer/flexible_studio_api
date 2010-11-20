package api.browser.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.notifiers.ClearNotifyEvent;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Browser
	{	
		// Required	
		public var event:String = null
		
		public function ClearNotify(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clearNotification( notificationEvent:String = null ):void
		{
			event = compareStrings( notificationEvent , event );
			switch( event )
			{
				case null:
					missingEvent();
				default:
					ssCore.Browser.clearNotify( {event:event} , {callback:actionComplete, errorSTR:"clearNotifyError", code:"10007"} );
			}	
		}
	}
}