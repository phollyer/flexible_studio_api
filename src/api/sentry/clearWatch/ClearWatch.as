package api.sentry.clearWatch
{
	import api.events.sentry.clearWatch.ClearWatchEvent;

	import api.sentry.Sentry;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Remove all applications from the Sentry watch list.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_clearWatch.html Northcode Help Documentation
	*/
	public class ClearWatch extends Sentry
	{
		/**
		* Constructor for Sentry.ClearWatch()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_clearWatch.html Northcode Help Documentation
		*/
		public function ClearWatch(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Remove all applications from the Sentry watch list.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_clearWatch.html Northcode Help Documentation
		*/
		public function clearWatch():void
		{
			ssCore.Sentry.clearWatch( {}
								     ,{callback:actionComplete, errorSTR:"clearWatchError", code:"37001"} );
		}
	}
}