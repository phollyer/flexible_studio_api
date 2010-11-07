package api.browser.back
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class Back extends Browser
	{
		public function Back(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function back():void
		{
			ssCore.Browser.back( {} , {callback:actionComplete, errorSTR:"backError", code:"10004"} );
		}
	}
}