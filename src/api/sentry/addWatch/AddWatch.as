package api.sentry.addWatch
{
	import api.events.sentry.addWatch.AddWatchEvent;

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
	* Specify an application that SWF Studio should watch for and prevent from running.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_addWatch.html Northcode Help Documentation
	*/
	public class AddWatch extends Sentry
	{
		// Required
		/**
		* The name of the application you want to block without the path, but including the extension, e.g. 'notepad.exe'.
		*
		* @defaultValue <code>null</code>
		*/
		public var application:String = null;
		
		/**
		* Constructor for Sentry.AddWatch()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_addWatch.html Northcode Help Documentation
		*/
		public function AddWatch(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Specify an application that SWF Studio should watch for and prevent from running.
		*
		*
		* @param app
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_addWatch.html Northcode Help Documentation
		*/
		public function addWatch( app:String = null ):void
		{
			application = compareStrings( app , application );
			
			switch( application )
			{
				case null:
					missingApplication();
					break;
				default:
					ssCore.Sentry.addWatch( {application:application}
										   ,{callback:actionComplete, errorSTR:"addWatchError", code:"37000"} );
			}
		}
	}
}