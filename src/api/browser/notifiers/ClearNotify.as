package api.browser.notifiers
{
	import api.browser.Browser;

	import api.events.browser.notifiers.ClearNotifyEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>event</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_EVENT
	*/
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_clearNotify.html Northcode Help Documentation
	*/
	public class ClearNotify extends Browser
	{	
		// Required	
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var event:String = null
		
		/**
		* Constructor for Browser.ClearNotify()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_clearNotify.html Northcode Help Documentation
		*/
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