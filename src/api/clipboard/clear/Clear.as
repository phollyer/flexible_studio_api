package api.clipboard.clear
{
	import api.clipboard.Clipboard;

	import api.events.clipboard.clear.ClearEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Clipboard_clear.html Northcode Help Documentation
	*/
	public class Clear extends Clipboard
	{
		/**
		* Constructor for Clipboard.Clear()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Clipboard_clear.html Northcode Help Documentation
		*/
		public function Clear(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Clipboard_clear.html Northcode Help Documentation
		*/
		public function clear():void
		{
			ssCore.Clipboard.clear( {} , {callback:actionComplete, errorSTR:"clearError", code:"12001"} );
		}
	}
}