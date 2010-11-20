package api.joystick.notifiers
{
	import api.events.joystick.notifiers.ClearNotifyEvent;

	import api.joystick.Joystick;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_clearNotify.html Northcode Help Documentation
	*/
	public class ClearNotify extends Joystick
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var event:String = null;
		
		/**
		* Constructor for Joystick.ClearNotify()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_clearNotify.html Northcode Help Documentation
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
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_clearNotify.html Northcode Help Documentation
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
					ssCore.Joystick.clearNotify( {event:event}
												,{callback:actionComplete, errorSTR:"clearNotifyError", code:"24011"} );
			}
		}
	}
}