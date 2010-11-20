package api.keyboard.ublockAll
{
	import api.events.keyboard.unblockAll.UnblockAllEvent;

	import api.keyboard.Keyboard;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
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
		*
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