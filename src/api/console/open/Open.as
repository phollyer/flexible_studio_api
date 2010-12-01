package api.console.open
{
	import api.console.Console;

	import api.events.console.open.OpenEvent;

	import api.vos.console.OpenVO;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_open.html Northcode Help Documentation
	*/
	public class Open extends Console
	{
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var consoleProperties:OpenVO = new OpenVO();
		
		/**
		* Constructor for Console.Open()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_open.html Northcode Help Documentation
		*/
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Console_open.html Northcode Help Documentation
		*/
		public function open():void
		{
			var __o : Object = consoleProperties.createObject();
			ssCore.Console.open( __o , {callback:actionComplete, errorSTR:"openError", code:"14002"} );
		}
	}
}