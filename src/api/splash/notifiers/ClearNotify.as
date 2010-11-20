package api.splash.notifiers
{
	import api.events.splash.notifiers.ClearNotifyEvent;

	import api.splash.Splash;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_clearNotify.html Northcode Help Documentation
	*/
	public class ClearNotify extends Splash
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var event:String = null;
		
		/**
		* Constructor for Splash.ClearNotify()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_clearNotify.html Northcode Help Documentation
		*/
		public function ClearNotify(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param eventName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_clearNotify.html Northcode Help Documentation
		*/
		public function clearNotify( eventName:String = null ):void
		{
			event = compareStrings( eventName , event );
			switch( event )
			{
				case null:
					missingEvent();
					break;
				default:
					ssCore.Splash.clearNotify( {event:event} , {callback:actionComplete, errorSTR:"clearNotifyError", code:"5004"} );
			}
		}
	}
}