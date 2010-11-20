package api.sentry.addWatch
{
	import flash.events.IEventDispatcher;
	import api.sentry.Sentry;
	
	[Event(name="missingApplication" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class AddWatch extends Sentry
	{
		// Required
		public var application:String = null;
		
		public function AddWatch(target:IEventDispatcher=null)
		{
			super(target);
		}
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