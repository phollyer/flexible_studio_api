package api.sentry.disable
{
	import api.events.sentry.disable.DisableEvent;

	import api.sentry.Sentry;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Disable blocking of applications on the Sentry watch list.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_disable.html Northcode Help Documentation
	*/
	public class Disable extends Sentry
	{		
		/**
		* Constructor for Sentry.Disable()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_disable.html Northcode Help Documentation
		*/
		public function Disable(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Disable blocking of applications on the Sentry watch list.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_disable.html Northcode Help Documentation
		*/
		public function disable():void
		{
			ssCore.Sentry.disable( {}
								  ,{callback:actionComplete, errorSTR:"disableError", code:"37002"} );
		}
	}
}