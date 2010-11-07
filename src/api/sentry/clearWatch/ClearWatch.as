package api.sentry.clearWatch
{
	import flash.events.IEventDispatcher;
	import api.sentry.Sentry;
	
	[Bindable]
	public class ClearWatch extends Sentry
	{
		public function ClearWatch(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clearWatch():void
		{
			ssCore.Sentry.clearWatch( {}
								     ,{callback:actionComplete, errorSTR:"clearWatchError", code:"37001"} );
		}
	}
}