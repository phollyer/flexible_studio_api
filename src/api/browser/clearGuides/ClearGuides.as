package api.browser.clearGuides
{
	import api.browser.Browser;

	import api.events.browser.clearGuides.ClearGuidesEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_clearGuides.html Northcode Help Documentation
	*/
	public class ClearGuides extends Browser
	{
		/**
		* Constructor for Browser.ClearGuides()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_clearGuides.html Northcode Help Documentation
		*/
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