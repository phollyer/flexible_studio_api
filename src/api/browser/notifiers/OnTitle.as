package api.browser.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.browser.Browser;
	
	import api.events.browser.notifiers.OnTitleEvent;

	[Bindable]
	public class OnTitle extends Browser
	{
		public var title:String = null;
		
		public function OnTitle(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_TITLE} , {callback:actionComplete, errorSTR:"onTitleError", code:"10035"} );
		}
		}		
	}
}