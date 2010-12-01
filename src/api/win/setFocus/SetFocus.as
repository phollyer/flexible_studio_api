package api.win.setFocus
{
	import api.events.win.setFocus.SetFocusEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setFocus.html Northcode Help Documentation
	*/
	public class SetFocus extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var hwnd:String = null;
		
		/**
		* Constructor for Win.SetFocus()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setFocus.html Northcode Help Documentation
		*/
		public function SetFocus(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setFocus.html Northcode Help Documentation
		*/
		public function setFocus():void
		{
			switch( hwnd )
			{
				case null:
					ssCore.Win.setFocus( {}
										,{callback:actionComplete, errorSTR:"setFocusError", code:"6023"} );
					break;
				default:
					ssCore.Win.setFocus( {hwnd:hwnd}
										,{callback:actionComplete, errorSTR:"setFocusError", code:"6023"} );
			}
		}
	}
}