package api.browser.setAnchors
{
	import api.browser.Browser;

	import api.events.browser.setAnchors.SetAnchorsEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setAnchors.html Northcode Help Documentation
	*/
	public class SetAnchors extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var bottom:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var left:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var right:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var top:Number = 0;
		
		/**
		* Constructor for Browser.SetAnchors()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setAnchors.html Northcode Help Documentation
		*/
		public function SetAnchors(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setAnchors.html Northcode Help Documentation
		*/
		public function setAnchors():void
		{
			ssCore.Browser.setAnchors( {bottom:bottom
									   ,left:left
									   ,right:right
									   ,top:top} , {callback:actionComplete, errorSTR:"setAnchorsError", code:"10024"} );
		}
	}
}