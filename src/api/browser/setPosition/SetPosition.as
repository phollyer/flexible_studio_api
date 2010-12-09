package api.browser.setPosition
{
	import api.browser.Browser;

	import api.events.browser.setPosition.SetPositionEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Set the position of the browser window relative to the upper left corner of the Flash movie.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setPosition.html Northcode Help Documentation
	*/
	public class SetPosition extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var x:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var y:Number = 0;
		
		/**
		* Constructor for Browser.SetPosition()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setPosition.html Northcode Help Documentation
		*/
		public function SetPosition(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the position of the browser window relative to the upper left corner of the Flash movie.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_setPosition.html Northcode Help Documentation
		*/
		public function setPosition():void
		{
			ssCore.Browser.setPosition( {x:x , y:y} , {callback:actionComplete, errorSTR:"setPositionError", code:"10036"} );
		}
	}
}