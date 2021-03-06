package api.app.forceExitWindows
{
	import api.app.App;

	import api.events.app.forceExitWindows.ForceExitWindowsEvent;

	import flash.events.IEventDispatcher;

	/**
	 * Dispatched if the Property <code>method</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_METHOD
	 */
	[Event(name="missingMethod" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 * Force Windows shutdown, reboot or logoff.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_forceExitWindows.html Northcode Help Documentation
	 */
	public class ForceExitWindows extends App
	{
		public static const LOG_OFF:String = "logoff";
		public static const REBOOT:String = "reboot";
		public static const SHUT_DOWN:String = "shutdown";
		public static const EXIT_OPTIONS:Array = new Array( LOG_OFF
														   ,REBOOT
														   ,SHUT_DOWN );
		
		// Required
		/**
		 * Valid values include: shutdown, reboot, and logoff.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var method:String = null;
		
		/**
		 * Constructor for App.ForceExitWindows()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_forceExitWindows.html Northcode Help Documentation
		 */
		public function ForceExitWindows(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Force Windows shutdown, reboot or logoff.
		 *
                 *
		 * @param exitMethod
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_forceExitWindows.html Northcode Help Documentation
		 */
		public function forceExitWindows( exitMethod:String ):void
		{
			method = compareStrings( exitMethod , method );
			switch( method )
			{
				case null:
					missingMethod();
					break;
				default:
					ssCore.App.forceExitWindows( {method:method} , {callback:actionComplete, errorSTR:"forceExitWindowsError", code:"8010"} );
			}
		}
	}
}