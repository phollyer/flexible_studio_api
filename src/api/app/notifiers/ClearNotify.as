package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.ClearNotifyEvent;
	
	/**
	 * Dispatched if the Property <code>event</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_EVENT
	 */
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
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
	 */
	public class ClearNotify extends App
	{
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var event:String = null;
		
		/**
		 * Constructor for App.ClearNotify()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		/**
		 * Constructor for App.ClearNotify()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		public function ClearNotify(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param notificationEvent
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		/**
		 *
		 *
                 *
		 * @param notificationEvent
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		public function clearNotify( notificationEvent:String = null ):void
		{
			event = compareStrings( notificationEvent , event );
			
			switch( event )
			{
				case null:
					missingEvent();
					break;
				default:
					ssCore.App.clearNotify( {event:event}
										   ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"8034"} );
			}
		}
	}
}