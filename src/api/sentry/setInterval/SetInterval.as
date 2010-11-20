package api.sentry.setInterval
{
	import flash.events.IEventDispatcher;
	import api.sentry.Sentry;
	
	[Bindable]
	public class SetInterval extends Sentry
	{
		// Optional
		public var interval:Number = 10;
		
		public function SetInterval(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setInterval():void
		{
			ssCore.Sentry.setInterval( {interval:interval}
								   	  ,{callback:actionComplete, errorSTR:"setIntervalError", code:"37005"} );
		}
	}
}