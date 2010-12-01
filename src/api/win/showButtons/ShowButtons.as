package api.win.showButtons
{
	import api.events.win.showButtons.ShowButtonsEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_showButtons.html Northcode Help Documentation
	*/
	public class ShowButtons extends Win
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var close:Boolean = true;
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var maximize:Boolean = true;
		/**
		* 
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
		*
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