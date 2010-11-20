package api.sentry.removeWatch
{
	import flash.events.IEventDispatcher;
	import api.sentry.Sentry;
	
	[Event(name="missingApplication" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class RemoveWatch extends Sentry
	{
		// Required
		public var application:String = null;
		
		public function RemoveWatch(target:IEventDispatcher=null)
		{
			super(target);
		}
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