package api.app.forceExitWindows
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;

	[Event(name="missingMethod" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ForceExitWindows extends App
	{
		public static const LOG_OFF:String = "logoff";
		public static const REBOOT:String = "reboot";
		public static const SHUT_DOWN:String = "shutdown";
		public static const EXIT_OPTIONS:Array = new Array( LOG_OFF
														   ,REBOOT
														   ,SHUT_DOWN );
		
		// Required
		public var method:String = null;
		
		public function ForceExitWindows(target:IEventDispatcher=null)
		{
			super(target);
		}
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