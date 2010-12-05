package api.win.setBottom
{
	import api.events.win.setBottom.SetBottomEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Move your application window to the bottom of the window z-order.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setBottom.html Northcode Help Documentation
	*/
	public class SetBottom extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.SetBottom()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setBottom.html Northcode Help Documentation
		*/
		public function SetBottom(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Move your application window to the bottom of the window z-order.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setBottom.html Northcode Help Documentation
		*/
		public function setBottom():void
		{
			ssCore.Win.setBottom( {flag:flag}
								 ,{callback:actionComplete, errorSTR:"setBottomError", code:"6019"} );
		}
	}
}