package api.browser.setVisible
{
	import api.browser.Browser;

	import api.events.browser.setVisible.SetVisibleEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setVisible.html Northcode Help Documentation
	*/
	public class SetVisible extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var flag:Boolean = false;
		
		/**
		* Constructor for Browser.SetVisible()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setVisible.html Northcode Help Documentation
		*/
		public function SetVisible(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show():void
		{
			flag = true;
			setVisible();
		}
		public function hide():void
		{
			flag = false;
			setVisible();
		}
		private function setVisible():void
		{
			ssCore.Browser.setVisible( {flag:flag} , {callback:actionComplete, errorSTR:"setVisibleError", code:"10040"} );
		}
	}
}