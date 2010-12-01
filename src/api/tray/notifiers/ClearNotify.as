package api.tray.notifiers
{
	import api.events.tray.notifiers.ClearNotifyEvent;

	import api.tray.Tray;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_clearNotify.html Northcode Help Documentation
	*/
	public class ClearNotify extends Tray
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var event:String = null;
		
		/**
		* Constructor for Tray.ClearNotify()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_clearNotify.html Northcode Help Documentation
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
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_clearNotify.html Northcode Help Documentation
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
					ssCore.Tray.clearNotify( {event:event}
										    ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"43009"} );
			}
		}
	}
}