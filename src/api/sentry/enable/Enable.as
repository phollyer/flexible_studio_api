package api.sentry.enable
{
	import api.events.sentry.enable.EnableEvent;

	import api.sentry.Sentry;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_enable.html Northcode Help Documentation
	*/
	public class Enable extends Sentry
	{		
		/**
		* Constructor for Sentry.Enable()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_enable.html Northcode Help Documentation
		*/
		public function Enable(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_enable.html Northcode Help Documentation
		*/
		public function enable():void
		{
			ssCore.Sentry.enable( {}
								 ,{callback:actionComplete, errorSTR:"enableError", code:"37003"} );
		}
	}
}