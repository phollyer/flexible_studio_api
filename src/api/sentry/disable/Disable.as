package api.sentry.disable
{
	import flash.events.IEventDispatcher;
	import api.sentry.Sentry;
	
	[Bindable]
	public class Disable extends Sentry
	{		
		public function Disable(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function disable():void
		{
			ssCore.Sentry.disable( {}
								  ,{callback:actionComplete, errorSTR:"disableError", code:"37002"} );
		}
	}
}