package api.browser.refresh
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class Refresh extends Browser
	{
		public function Refresh(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function refresh():void
		{
			ssCore.Browser.refresh( {} , {callback:actionComplete, errorSTR:"refreshError", code:"10021"} );
		}
	}
}