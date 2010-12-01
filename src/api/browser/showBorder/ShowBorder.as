package api.browser.showBorder
{
	import api.browser.Browser;

	import api.events.browser.showBorder.ShowBorderEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_showBorder.html Northcode Help Documentation
	*/
	public class ShowBorder extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var _flag:Boolean = false;
		
		/**
		* Constructor for Browser.ShowBorder()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_showBorder.html Northcode Help Documentation
		*/
		public function ShowBorder(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			_flag = true;
			setBorders();
		}
		public function hide():void
		{
			_flag = false;
			setBorders();
		}
		private function setBorders():void
		{
			ssCore.Browser.showBorder( {flag:_flag} , {callback:actionComplete, errorSTR:"showBorderError", code:"10041"} );
		}
	}
}