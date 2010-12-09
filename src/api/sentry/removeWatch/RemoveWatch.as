package api.sentry.removeWatch
{
	import api.events.sentry.removeWatch.RemoveWatchEvent;

	import api.sentry.Sentry;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>application</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_APPLICATION
	*/
	[Event(name="missingApplication" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Specify an application to be removed from the Sentry watch list.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_removeWatch.html Northcode Help Documentation
	*/
	public class RemoveWatch extends Sentry
	{
		// Required
		/**
		* The name of the application to remove from the watch list. The name must have been previously passed to Sentry.addWatch.
		*
		* @defaultValue <code>null</code>
		*/
		public var application:String = null;
		
		/**
		* Constructor for Sentry.RemoveWatch()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_removeWatch.html Northcode Help Documentation
		*/
		public function RemoveWatch(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Specify an application to be removed from the Sentry watch list.
		*
		*
		* @param app
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_removeWatch.html Northcode Help Documentation
		*/
		public function removeWatch( app:String = null ):void
		{
			application = compareStrings( app , application );
			
			switch( application )
			{
				case null:
					missingApplication();
					break;
				default:
					ssCore.Sentry.removeWatch( {application:application}
										   	  ,{callback:actionComplete, errorSTR:"removeWatchError", code:"37004"} );
			}
		}
	}
}