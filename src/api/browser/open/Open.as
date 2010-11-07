package api.browser.open
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class Open extends Browser
	{
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function open():void
		{
			ssCore.Browser.open( {} , {callback:actionComplete, errorSTR:"openError", code:"10017"} );
		}
	}
}