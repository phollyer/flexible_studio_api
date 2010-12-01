package api.browser.notifiers
{
	import api.browser.Browser;

	import api.events.browser.notifiers.OnTitleEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onTitle.html Northcode Help Documentation
	*/
	public class OnTitle extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var title:String = null;
		
		/**
		* Constructor for Browser.OnTitle()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onTitle.html Northcode Help Documentation
		*/
		public function OnTitle(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_TITLE} , {callback:actionComplete, errorSTR:"onTitleError", code:"10035"} );
		}		
	}
}