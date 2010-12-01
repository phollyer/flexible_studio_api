package api.fileSys.notifiers
{
	import api.events.app.notifiers.ClearNotifyEvent;

	import api.events.fileSys.notifiers.ClearNotifyEvent;

	import api.fileSys.FileSys;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_clearNotify.html Northcode Help Documentation
	*/
	public class ClearNotify extends FileSys
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var event:String = null;
		
		/**
		* Constructor for FileSys.ClearNotify()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_clearNotify.html Northcode Help Documentation
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
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_clearNotify.html Northcode Help Documentation
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
					ssCore.FileSys.clearNotify( {event:event}
											   ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"9040"} );
			}
		}
	}
}