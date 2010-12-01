package api.browser.allowDragDrop
{
	import api.browser.Browser;

	import api.events.browser.allowDragDrop.AllowDragDropEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_allowDragDrop.html Northcode Help Documentation
	*/
	public class AllowDragDrop extends Browser
	{		
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var _allow:Boolean = true;
		
		/**
		* Constructor for Browser.AllowDragDrop()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_allowDragDrop.html Northcode Help Documentation
		*/
		public function AllowDragDrop(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function allow():void
		{
			_allow = true;
			setBrowser();
		}
		public function deny():void
		{
			_allow = false;
			setBrowser();
		}
		private function setBrowser():void
		{
			ssCore.Browser.allowDragDrop( {flag:_allow} , {callback:actionComplete, errorSTR:"allowDragDropError", code:"10001"} );			
		}
	}
}