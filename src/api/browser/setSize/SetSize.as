package api.browser.setSize
{
	import api.browser.Browser;

	import api.events.browser.setSize.SetSizeEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setSize.html Northcode Help Documentation
	*/
	public class SetSize extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>100</code>
		*/
		public var height:Number = 100;
		/**
		* 
		*
		* @defaultValue <code>100</code>
		*/
		public var width:Number = 100;
		
		/**
		* Constructor for Browser.SetSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setSize.html Northcode Help Documentation
		*/
		public function SetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setSize.html Northcode Help Documentation
		*/
		public function setSize():void
		{
			ssCore.Browser.setSize( {height:height , width:width} , {callback:actionComplete, errorSTR:"setSizeError", code:"10038"} );
		}
	}
}