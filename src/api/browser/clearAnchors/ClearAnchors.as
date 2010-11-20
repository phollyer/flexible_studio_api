package api.browser.clearAnchors
{
	import api.browser.Browser;

	import api.events.browser.clearAnchors.ClearAnchorsEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_clearAnchors.html Northcode Help Documentation
	*/
	public class ClearAnchors extends Browser
	{		
		/**
		* Constructor for Browser.ClearAnchors()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_clearAnchors.html Northcode Help Documentation
		*/
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