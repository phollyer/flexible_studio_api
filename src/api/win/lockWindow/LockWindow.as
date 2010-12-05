package api.win.lockWindow
{
	import api.events.win.lockWindow.LockWindowEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Lock the window so it can't be moved or resized.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockWindow.html Northcode Help Documentation
	*/
	public class LockWindow extends Win
	{
		// Optional
		/**
		* A flag that controls whether the window should be locked at its current size and position or not. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var flag:Boolean = true;
		
		/**
		* Constructor for Win.LockWindow()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockWindow.html Northcode Help Documentation
		*/
		public function LockWindow(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Lock the window so it can't be moved or resized.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_lockWindow.html Northcode Help Documentation
		*/
		public function lockWindow():void
		{
			ssCore.Win.lockWindow( {flag:flag}
								  ,{callback:actionComplete, errorSTR:"lockWindowError", code:"6011"} );
		}
	}
}