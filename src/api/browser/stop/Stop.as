package api.browser.stop
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class Stop extends Browser
	{
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function stop():void
		{
			ssCore.Browser.stop( {} , {callback:actionComplete, errorSTR:"stopError", code:"10043"} );
		}
	}
}