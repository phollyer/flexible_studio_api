package api.browser.showScrollbars
{
	import api.browser.Browser;

	import api.events.browser.showScrollbars.ShowScrollbarsEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_showScrollbars.html Northcode Help Documentation
	*/
	public class ShowScrollbars extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var flag:Boolean = false;
		
		/**
		* Constructor for Browser.ShowScrollbars()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_showScrollbars.html Northcode Help Documentation
		*/
		public function ShowScrollbars(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			flag = true;
			setScrollBars();
		}
		public function hide():void
		{
			flag = false;
			setScrollBars();
		}
		private function setScrollBars():void
		{
			ssCore.Browser.showScrollbars( {flag:flag} , {callback:actionComplete, errorSTR:"showScrollbarsError", code:"10042"} );
		}
	}
}