package api.browser.clearAnchors
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;

	[Bindable]
	public class ClearAnchors extends Browser
	{		
		public function ClearAnchors(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clear():void
		{
			ssCore.Browser.clearAnchors( {} , {callback:actionComplete, errorSTR:"clearAnchorsError", code:"10005"} );
		}
	}
}