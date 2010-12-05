package api.keyboard.unblockAll
{
	import api.keyboard.Keyboard;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Clear the list of blocked keys.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_unblockAll.html Northcode Help Documentation
	*/
	public class UnblockAll extends Keyboard
	{
		/**
		* Constructor for Keyboard.UnblockAll()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_unblockAll.html Northcode Help Documentation
		*/
		public function UnblockAll(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Clear the list of blocked keys.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_unblockAll.html Northcode Help Documentation
		*/
		public function unblockAll():void
		{
			ssCore.Keyboard.unblockAll( {}
									   ,{callback:actionComplete, errorSTR:"unblockAllError", code:"25009"} );
		}
	}
}