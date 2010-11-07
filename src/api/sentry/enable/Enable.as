package api.sentry.enable
{
	import flash.events.IEventDispatcher;
	import api.sentry.Sentry;
	
	[Bindable]
	public class Enable extends Sentry
	{		
		public function Enable(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function enable():void
		{
			ssCore.Sentry.enable( {}
								 ,{callback:actionComplete, errorSTR:"enableError", code:"37003"} );
		}
	}
}