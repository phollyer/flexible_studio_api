package api.browser.setAnchors
{
	import api.browser.Browser;

	import api.events.browser.setAnchors.SetAnchorsEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set anchors to link the edges of the browser window to the edges of the player window for automatic resizing of the browser window that matches the player window's client area.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setAnchors.html Northcode Help Documentation
	*/
	public class SetAnchors extends Browser
	{
		/**
		* Distance in pixels that the bottom edge of the browser should maintain from the bottom edge of the player window's client area.
		*
		* @defaultValue <code>0</code>
		*/
		public var bottom:Number = 0;
		/**
		* Distance in pixels that the left edge of the browser should maintain from the left edge of the player window's client area.
		*
		* @defaultValue <code>0</code>
		*/
		public var left:Number = 0;
		/**
		* Distance in pixels that the right edge of the browser should maintain from the right edge of the player window's client area.
		*
		* @defaultValue <code>0</code>
		*/
		public var right:Number = 0;
		/**
		* Distance in pixels that the top edge of the browser should maintain from the top edge of the player window's client area.
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
		* Set anchors to link the edges of the browser window to the edges of the player window for automatic resizing of the browser window that matches the player window's client area.
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