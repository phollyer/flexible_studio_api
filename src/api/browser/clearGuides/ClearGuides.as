package api.browser.clearGuides
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	[Bindable]
	public class ClearGuides extends Browser
	{
		public function ClearGuides(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clear():void
		{
			ssCore.Browser.clearGuides( {} , {callback:actionComplete, errorSTR:"clearGuidesError", code:"10006"} );
		}
	}
}