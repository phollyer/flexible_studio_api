package api.win.setTopmost
{
	import api.events.win.setTopmost.SetTopmostEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Move your application window to the top of the z-order.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setTopmost.html Northcode Help Documentation
	*/
	public class SetTopmost extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var aggressive:Boolean = false;
		/**
		* A flag indicates whether the application window should be topmost or not. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.SetTopmost()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setTopmost.html Northcode Help Documentation
		*/
		public function SetTopmost(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Move your application window to the top of the z-order.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setTopmost.html Northcode Help Documentation
		*/
		public function setTopmost():void
		{
			ssCore.Win.setTopmost( {aggrseeive:aggressive , flag:flag}
								  ,{callback:actionComplete, errorSTR:"setTopmostError", code:"6030"} );
		}
	}
}