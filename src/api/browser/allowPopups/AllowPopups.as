package api.browser.allowPopups
{
	import api.browser.Browser;

	import api.events.browser.allowPopups.AllowPopupsEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_allowPopups.html Northcode Help Documentation
	*/
	public class AllowPopups extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var allowPopUps:Boolean = true;
		
		/**
		* Constructor for Browser.AllowPopups()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_allowPopups.html Northcode Help Documentation
		*/
		public function AllowPopups(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function allow():void
		{
			allowPopUps = true;
			setPopUps();
		}
		public function deny():void
		{
			allowPopUps = false;
			setPopUps();
		}
		private function setPopUps():void
		{
			ssCore.Browser.allowPopups( {flag:allowPopUps} , {callback:actionComplete, errorSTR:"allowPopupsError", code:"10003"} );
		}
	}
}