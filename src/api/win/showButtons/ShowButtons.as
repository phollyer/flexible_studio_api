package api.win.showButtons
{
	import api.events.win.showButtons.ShowButtonsEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Show or hide the minimize, maximize and close buttons on the title bar.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showButtons.html Northcode Help Documentation
	*/
	public class ShowButtons extends Win
	{
		// Optional
		/**
		* Enable or disable the close button. Windows doesn't actually hide this button while the window has an icon in the upper left corner. Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var close:Boolean = true;
		/**
		* Show or hide the maximize button on the title bar. If the minimize button is still enabled the maximize button will just be grayed out instead of hidden (Windows behavior). Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var maximize:Boolean = true;
		/**
		* Show or hide the minimize button on the title bar. If the maximize button is still enabled the minimize button will just be grayed out instead of hidden (Windows behavior). Valid values include: true and false.
		*
		* @defaultValue <code>true</code>
		*/
		public var minimize:Boolean = true;
		
		/**
		* Constructor for Win.ShowButtons()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showButtons.html Northcode Help Documentation
		*/
		public function ShowButtons(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Show or hide the minimize, maximize and close buttons on the title bar.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showButtons.html Northcode Help Documentation
		*/
		public function showButtons():void
		{
			ssCore.Win.showButtons( {close:close , maximize:maximize , minimize:minimize}
								   ,{callback:actionComplete, errorSTR:"showButtonsError", code:"6033"} );
		}
	}
}