package api.browser.setURL
{
	import api.browser.Browser;

	import api.events.browser.setURL.SetURLEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setURL.html Northcode Help Documentation
	*/
	public class SetURL extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var url:String = null;
		
		/**
		* Constructor for Browser.SetURL()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setURL.html Northcode Help Documentation
		*/
		public function SetURL(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setURL.html Northcode Help Documentation
		*/
		public function setURL():void
		{
			ssCore.Browser.setURL( {url:url} , {callback:actionComplete, errorSTR:"setURLError", code:"10039"} );
		}
	}
}