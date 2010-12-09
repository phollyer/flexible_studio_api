package api.sentry.setInterval
{
	import api.events.sentry.setInterval.SetIntervalEvent;

	import api.sentry.Sentry;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Specify how often SWF Studio should check for blocked applications.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_setInterval.html Northcode Help Documentation
	*/
	public class SetInterval extends Sentry
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>10</code>
		*/
		public var interval:Number = 10;
		
		/**
		* Constructor for Sentry.SetInterval()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_setInterval.html Northcode Help Documentation
		*/
		public function SetInterval(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Specify how often SWF Studio should check for blocked applications.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Sentry_setInterval.html Northcode Help Documentation
		*/
		public function setInterval():void
		{
			ssCore.Sentry.setInterval( {interval:interval}
								   	  ,{callback:actionComplete, errorSTR:"setIntervalError", code:"37005"} );
		}
	}
}