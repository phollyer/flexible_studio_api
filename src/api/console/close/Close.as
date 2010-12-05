package api.console.close
{
	import api.console.Console;

	import api.events.console.close.CloseEvent;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Close the output console window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_close.html Northcode Help Documentation
	*/
	public class Close extends Console
	{
		/**
		* Constructor for Console.Close()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_close.html Northcode Help Documentation
		*/
		public function Close(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Close the output console window.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_close.html Northcode Help Documentation
		*/
		public function close():void
		{
			ssCore.Console.close( {} , {callback:actionComplete, errorSTR:"closeError", code:"14001"} );
		}
	}
}