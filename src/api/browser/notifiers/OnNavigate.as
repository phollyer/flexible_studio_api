package api.browser.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.notifiers.OnNavigateEvent;

	[Bindable]
	public class OnNavigate extends Browser
	{
		public var url:String = null;
		
		public function OnNavigate(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_NAVIGATE} , {callback:actionComplete, errorSTR:"onNavigateError", code:"10031"} );
		}
		}		
	}
}